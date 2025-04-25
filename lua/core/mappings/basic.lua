local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clear search highlights
map('n', '<leader>h', ':nohlsearch<CR>', opts)

-- Delete single character without copying into register
map('n', 'x', '"_x', opts)

-- Window management
map('n', '<leader>sv', '<C-w>v', opts)    
map('n', '<leader>sh', '<C-w>s', opts)     
map('n', '<leader>se', '<C-w>=', opts)    
map('n', '<leader>sx', ':close<CR>', opts) 

-- Buffer navigation
map('n', '<leader>bn', ':bnext<CR>', opts)    
map('n', '<leader>bp', ':bprevious<CR>', opts) 
map('n', '<leader>bd', ':bdelete<CR>', opts)    

-- Move text up and down
map('v', 'J', ":m '>+1<CR>gv=gv", opts) 
map('v', 'K', ":m '<-2<CR>gv=gv", opts)  

-- Better indenting
map('v', '<', '<gv', opts) 
map('v', '>', '>gv', opts)  

-- Move between windows
map('n', '<C-h>', '<C-w>h', opts)  
map('n', '<C-j>', '<C-w>j', opts)  
map('n', '<C-k>', '<C-w>k', opts)  
map('n', '<C-l>', '<C-w>l', opts) 

-- Resize windows
map('n', '<C-Up>', ':resize -2<CR>', opts)          
map('n', '<C-Down>', ':resize +2<CR>', opts)       
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)
