local M = {}

-- Subscribe to cd events and record to autojump database
local record_visit = ya.sync(function()
	ps.sub("cd", function()
		ya.emit("shell", {
			"autojump --add \"$PWD\"",
			block = false,
			orphan = true,
		})
	end)
end)

function M.setup()
	record_visit()
end

-- async plugin (no ---@sync here)
function M.entry()
  -- nice top-center modal like search
  local query, event = ya.input {
    title    = "Autojump:",
    value    = "",
    pos = { "top-center", y = 3, w = 40 },
  }

  -- 1 = user confirmed
  if event ~= 1 or not query or query == "" then
    return
  end

  -- run our helper
  local output, err = Command("yazi-jump")
    :arg(query)
    :stdout(Command.PIPED)
    :output()

  if not output then
    ya.err("autojump: " .. tostring(err))
    ya.notify {
      title = "Autojump",
      content = "Failed to run yazi-jump",
      level = "error",
      timeout = 3,
    }
    return
  end

  -- grab the path from stdout
  local path = (output.stdout or ""):gsub("%s+$", "")
  if path == "" then
    ya.notify {
      title   = "Autojump",
      content = 'No match for "' .. query .. '"',
      level   = "warn",
      timeout = 2.5,
    }
    return
  end

  -- actually jump inside Yazi
  ya.emit("cd", { path })
end

return M
