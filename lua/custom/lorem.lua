local M = {}

local function generate_lorem_ipsum(num_words)
  local words = {
    'Lorem',
    'ipsum',
    'dolor',
    'sit',
    'amet,',
    'consectetur',
    'adipiscing',
    'elit.',
    'Sed',
    'do',
    'eiusmod',
    'tempor',
    'incididunt',
    'ut',
    'labore',
    'et',
    'dolore',
    'magna',
    'aliqua.',
  }

  local lorem_text = {}
  for i = 1, num_words do
    table.insert(lorem_text, words[(i - 1) % #words + 1])
  end

  return lorem_text
end

function M.insert_lorem(words)
  words = words or 20
  local lorem_words = generate_lorem_ipsum(words)

  local lines = {}
  local line_length = 10

  for i = 1, #lorem_words, line_length do
    local line = table.concat(vim.list_slice(lorem_words, i, i + line_length - 1), ' ')
    table.insert(lines, line)
  end

  vim.api.nvim_put(lines, 'l', true, true)
end

function M.setup()
  vim.cmd "command! -nargs=? InsertLorem lua require'custom.lorem'.insert_lorem(<f-args>)"
end

return M
