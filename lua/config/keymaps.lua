-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local terminal = require("config.terminal")

terminal.setup()

map({ "i", "n", "v" }, "<C-s>", function()
  vim.cmd("silent! write")
end, { desc = "Save file" })

map("n", "<Esc>", function()
  vim.cmd("nohlsearch")
  vim.cmd("stopinsert")
end, { desc = "Clear search highlight" })

map("n", "<leader>ur", function()
  vim.cmd("nohlsearch")
  vim.cmd("diffupdate")
  vim.cmd("normal! <C-l>")
end, { desc = "Refresh UI" })

map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New buffer" })

map("n", "<leader>tt", function()
  terminal.toggle_bottom("buffer")
end, { desc = "Terminal (here)" })

map("n", "<leader>tT", function()
  terminal.toggle_bottom("root")
end, { desc = "Terminal (root)" })

map("n", "<leader>tf", function()
  terminal.toggle_float("buffer")
end, { desc = "Terminal float (here)" })

map("n", "<leader>tF", function()
  terminal.toggle_float("root")
end, { desc = "Terminal float (root)" })

map("n", "<leader>og", function()
  terminal.open_ghostty("buffer")
end, { desc = "Ghostty (here)" })

map("n", "<leader>oG", function()
  terminal.open_ghostty("root")
end, { desc = "Ghostty (root)" })

map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Go to left window" })
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Go to lower window" })
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Go to upper window" })
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Go to right window" })
