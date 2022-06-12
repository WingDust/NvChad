-- example file i.e lua/custom/init.lua

-- load your globals, autocmds here or anything .__.



local opt = {
  noremap = true,
  silent = true,
}
-- 本地变量
local map = vim.api.nvim_set_keymap

map("v","v","V",opt)
--map("n","<Tab>","%",opt)


map("t","<esc>","<C-\\><C-n> ",opt)



--vim.api.nvim_eval('set shell=pwsh')
--
-- lua config
-- https://stackoverflow.com/questions/36108950/setting-up-powershell-as-vims-shell-command-does-not-seem-to-be-passed-correct
vim.cmd([[
set shell=pwsh
set shellcmdflag=-command
set shellquote=\"
set shellxquote=
set clipboard=unnamed
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
]])

-- https://github.com/wochap/nvim/blob/main/lua/custom/globals.lua
-- Fix error when using nvim inside nvim terminal
vim.cmd [[
   if has('nvim') && executable('nvr')
      let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
   endif
   autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
]]
