local M = {}

function M.CopyClaudeReference()
  local file_path = vim.fn.expand('%:.')
  if file_path == '' then
    print('No file open')
    return
  end

  local reference = '@' .. file_path
  vim.fn.setreg('+', reference)
  print('Copied: ' .. reference)
end

function M.CopyClaudeReferenceWithSelection()
  local file_path = vim.fn.expand('%:.')
  if file_path == '' then
    print('No file open')
    return
  end

  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")
  local start_line = math.min(start_pos[2], end_pos[2])
  local end_line = math.max(start_pos[2], end_pos[2])

  local reference = '@' .. file_path

  -- Get selected text
  local lines = vim.fn.getline(start_line, end_line)
  if type(lines) == 'string' then
    lines = { lines }
  end

  -- Handle partial line selection in visual mode
  local mode = vim.fn.visualmode()
  if mode == 'v' then
    -- Character-wise visual mode
    local start_col = start_pos[3]
    local end_col = end_pos[3]

    if #lines == 1 then
      lines[1] = string.sub(lines[1], start_col, end_col)
    else
      lines[1] = string.sub(lines[1], start_col)
      lines[#lines] = string.sub(lines[#lines], 1, end_col)
    end
  end

  local content = table.concat(lines, '\n')
  local full_reference = reference .. '\n\n' .. content

  vim.fn.setreg('+', full_reference)
  print('Copied: ' .. reference .. ' with selection')
end

function M.CopyClaudeReferenceWithLineRange()
  local file_path = vim.fn.expand('%:.')
  if file_path == '' then
    print('No file open')
    return
  end

  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")
  local start_line = math.min(start_pos[2], end_pos[2])
  local end_line = math.max(start_pos[2], end_pos[2])

  local reference
  if start_line == end_line then
    reference = '@' .. file_path .. '#L' .. start_line
  else
    reference = '@' .. file_path .. '#L' .. start_line .. '-' .. end_line
  end

  vim.fn.setreg('+', reference)
  print('Copied: ' .. reference)
end

return M
