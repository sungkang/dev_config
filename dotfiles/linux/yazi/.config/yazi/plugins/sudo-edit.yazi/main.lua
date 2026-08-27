--- sudo-edit.yazi — open files as root in your editor, asking for the password inside Yazi.
---
--- Usage:
---   plugin sudo-edit            sudoedit: your editor runs as you, the file is written as root
---   plugin sudo-edit -- root    the editor process itself runs as root

local M = {}

local function notify(content, level)
	ya.notify { title = "sudo-edit", content = content, level = level or "info", timeout = 3 }
end

-- Selected files, or the hovered one when nothing is selected.
-- Url.path drops any scheme (search://, archive://, sftp://...), leaving the real
-- filesystem path; entries with no local path are skipped.
local selected_or_hovered = ya.sync(function()
	local tab = cx.active
	local urls, paths, skipped = {}, {}, 0

	for _, u in pairs(tab.selected) do
		urls[#urls + 1] = u
	end
	if #urls == 0 and tab.current.hovered then
		urls[1] = tab.current.hovered.url
	end

	for _, u in ipairs(urls) do
		-- Scheme comes off the URL string itself, so no deprecated field is touched.
		-- No scheme = a plain local file; "search" = a local file found via search, whose
		-- Url.path is already the real path. Anything else (archive://, sftp://...) has no
		-- local path sudoedit could open.
		local scheme = tostring(u):match("^(%a[%w+.%-]*)://")
		if scheme and scheme ~= "search" then
			skipped = skipped + 1
		else
			local path = tostring(u.path)
			if path:sub(1, 1) ~= "/" then
				path = tostring(tab.current.cwd.path) .. "/" .. path
			end
			paths[#paths + 1] = path
		end
	end

	return { paths = paths, skipped = skipped }
end)

local function editor()
	return os.getenv("SUDO_EDITOR") or os.getenv("VISUAL") or os.getenv("EDITOR") or "vi"
end

-- True when sudo's timestamp is still valid, so no password is needed.
local function cached()
	local status = Command("sudo")
		:arg { "-n", "-v" }
		:stdout(Command.NULL)
		:stderr(Command.NULL)
		:status()
	return status and status.success
end

-- Refresh sudo's timestamp. The password is written to sudo's stdin only: never
-- to argv, the environment, a temp file, or any log/notification.
-- Returns: ok, sudo's stderr (for diagnostics; it never contains the password).
local function validate(pw)
	local child, err = Command("sudo")
		:arg { "-S", "-p", "", "-v" }
		:stdin(Command.PIPED)
		:stdout(Command.NULL)
		:stderr(Command.PIPED)
		:spawn()
	if not child then
		return false, "cannot spawn sudo: " .. tostring(err)
	end

	local ok, werr = child:write_all(pw .. "\n")
	if not ok then
		return false, "cannot write to sudo: " .. tostring(werr)
	end
	-- stdin is buffered; without this flush sudo sees EOF and no password
	local flushed, ferr = pcall(function() child:flush() end)
	if not flushed then
		return false, "cannot flush sudo stdin: " .. tostring(ferr)
	end

	local output, oerr = child:wait_with_output()
	if not output then
		return false, "cannot wait for sudo: " .. tostring(oerr)
	end
	return output.status.success, (output.stderr or ""):gsub("%s+$", "")
end

local function authenticate()
	if cached() then
		return true
	end

	for i = 1, 3 do
		local pw, event = ya.input {
			title = i == 1 and "[sudo] password:" or string.format("[sudo] password (%d/3):", i),
			obscure = true,
			pos = { "center", w = 40 },
		}
		if event ~= 1 then
			return false -- cancelled
		end

		local ok, msg = validate(pw or "")
		if ok then
			return true
		end
		notify(msg ~= "" and msg or "Sorry, try again.", "warn")
	end

	notify("3 incorrect password attempts", "error")
	return false
end

-- Single-quote a string for /bin/sh.
local function quote(s)
	return "'" .. s:gsub("'", "'\\''") .. "'"
end

function M:entry(job)
	local mode = job and job.args and job.args[1] or "edit"
	local found = selected_or_hovered()
	local paths, skipped = found.paths, found.skipped
	if #paths == 0 then
		return notify(skipped > 0 and "No local file to edit" or "No file to edit", "warn")
	elseif skipped > 0 then
		notify(string.format("Skipped %d non-local file(s)", skipped), "warn")
	end

	if not authenticate() then
		return
	end

	-- sudoedit keeps the editor running as you; "root" runs the editor itself as root.
	local cmd = { "SUDO_EDITOR=" .. quote(editor()), "sudo" }
	cmd[#cmd + 1] = mode == "root" and "-E -- " .. quote(editor()) or "-e --"
	for _, p in ipairs(paths) do
		cmd[#cmd + 1] = quote(p)
	end

	-- block = true hands the terminal to the editor and restores the TUI afterwards.
	ya.emit("shell", { table.concat(cmd, " "), block = true })
end

return M
