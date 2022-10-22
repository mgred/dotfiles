local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.colorcolumn = '80'
opt.swapfile = false
opt.showmode = false
opt.showcmd = false
opt.shortmess = 'I'
opt.signcolumn = 'no'
opt.fileencoding = 'utf-8'
opt.syntax = 'on'
opt.updatetime = 100
opt.hidden = true
opt.ruler = false
opt.fillchars.vert = '│'
opt.termguicolors = true
opt.wrap = false
opt.laststatus = 1
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.fillchars:append({ eob = [[ ]], vert = [[ ]] }) 

g.python_host_prog = '~/.tools/pyenv/shims/python'
g.python3_host_prog = '~/.tools/pyenv/shims/python3'

g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
