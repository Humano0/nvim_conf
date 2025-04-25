local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
  group = highlight_group,
})

autocmd('BufWritePre', {
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

autocmd('FocusGained', {
  pattern = '*',
  command = 'checktime',
})
