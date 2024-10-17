local M = {}

-- Define comment patterns for different file types
local comment_patterns = {
  lua = '%-%-', -- Lua uses "--" for comments (escaped for search)
  python = '#', -- Python uses "#" for comments
  javascript = '//', -- JavaScript/C-like languages use "//"
  c = '//', -- C uses "//"
  cpp = '//', -- C++ uses "//"
  sh = '#', -- Shell scripts use "#"
  rust = '//', -- Rust uses "//"
  java = '//', -- Java uses "//"
}

-- Function to move to the next line with a comment
function M.goto_next_comment()
  -- Get the current file type
  local filetype = vim.bo.filetype

  -- Determine the comment pattern for the current file type
  local comment_pattern = comment_patterns[filetype]

  if not comment_pattern then
    print('Comment pattern not found for this file type: ' .. filetype)
    return
  end

  -- Use vim.fn.search() to search for the next occurrence of the comment pattern
  local found = vim.fn.search(comment_pattern)

  if found == 0 then
    print 'No comment found'
  end
end

-- Keymap to call the function
function M.setup()
  -- Map the function to a key (e.g., <leader>c to go to the next comment)
  vim.api.nvim_set_keymap('n', '<leader>cc', ':lua require"custom.comment_finder".goto_next_comment()<CR>', { noremap = true, silent = true })
end

return M
