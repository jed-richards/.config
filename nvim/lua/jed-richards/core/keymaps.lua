-- Leader
vim.g.mapleader = " "

-- Aliases
local map = vim.keymap.set

-- File Explorer (NetRW)
map("n", "<leader>pv", vim.cmd.Ex)

-- Buffers
map("n", "<S-l>", "<cmd>bnext<cr>")
map("n", "<S-h>", "<cmd>bprev<cr>")

-- Neviagation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Text manipulation
map("v", ">", ">gv")
map("v", "<", "<gv")

