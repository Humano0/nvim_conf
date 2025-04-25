local opt = vim.opt

opt.number = true
opt.relativenumber = false

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.cursorline = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.background = "dark"
opt.showmatch = true
opt.colorcolumn = "120"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
opt.modifiable = true
opt.encoding = "UTF-8"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.updatetime = 100
opt.timeoutlen = 300
opt.completeopt = "menuone,noselect"
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.writebackup = false
opt.hidden = true
opt.mouse = "a"
