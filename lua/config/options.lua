-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fillchars = {
  eob = " ",
  fold = " ",
  foldclose = "",
  foldopen = "",
  foldsep = " ",
}
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.listchars = {
  nbsp = "␣",
  tab = "→ ",
  trail = "·",
}
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 6
opt.sessionoptions:append("localoptions")
opt.shiftwidth = 2
opt.shortmess:append({ I = true, W = true, c = true, C = true })
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartindent = true
opt.smoothscroll = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 200
opt.wrap = false

vim.g.autoformat = true
vim.o.winborder = "rounded"
