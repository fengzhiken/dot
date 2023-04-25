local set = vim.o

set.tabstop = 2
set.shiftwidth = 2
set.number = true
set.clipboard = "unnamedplus"
set.termguicolors = true
set.background = "dark"
vim.g.mapleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
require("lazy").setup("plugins", opts)
