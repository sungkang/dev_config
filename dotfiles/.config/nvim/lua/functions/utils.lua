local M = {}

function M.hexToRgba(hex)
  -- Remove the hash at the start if it's there
  hex = hex:gsub("#", "")

  -- Convert the red, green, blue, and alpha values
  local r = tonumber(hex:sub(1, 2), 16)
  local g = tonumber(hex:sub(3, 4), 16)
  local b = tonumber(hex:sub(5, 6), 16)
  local a = 1   -- Default alpha

  -- Check if there is an alpha value
  if #hex == 8 then
    a = tonumber(hex:sub(7, 8), 16) / 255
  end

  return string.format("rgba(%d, %d, %d, %.2f)", r, g, b, a)
end

function M.convertHexVisual()
    -- Get the visual selection
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])

    -- If the selection spans multiple lines, join them
    if #lines > 1 then
        hex = table.concat(lines, "")
    else
        -- Single line selection
        hex = lines[1]:sub(start_pos[3], end_pos[3])
    end

    -- Call the hexToRgba function
    M.hexToRgba(hex)
end

function M.repeatOpposite()
    vim.api.nvim_feedkeys(",", "n", false)
end

return M
