-- Just an example, supposed to be placed in /lua/custom/

local M = {}
--M.options ,M.ui,M.mappings,M.plugins = {},{},{},{}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:
M.options ={
  relativenumber = true,
  nvChad ={
    insert_nav = true
  }
}

M.ui = {
   theme = "gruvchad",
}


-- Install plugins
local userPlugins = require "custom.plugins" -- path to table

M.plugins = {
  --install = userPlugins,
  user = userPlugins,
  status={
    alpha=true,
   -- vim_matchup=true,
   -- nvimtree=false
  },
  options={
    packer ={
    --  init_file = "plugins.packerInit"
    },
  }

}

M.mappings ={
-- navigation in insert mode, only if enabled in options
 insert_nav = {
    --backward = "<C-h>",
--    end_of_line = "<C-e>",
--    forward = "<C-f>",
--    next_line = "<C-n>",
--    prev_line = "<C-p>",
--    beginning_of_line = "<C-a>",
 },
terminal ={
 --esc_termmode={ "<esc>"}
}

}



M.disabled={
  i={
    ["<C-h>"]=""
  }
}


local opt = {
  noremap = true,
  silent = true,
}
-- 本地变量
local map = vim.api.nvim_set_keymap

map("v","v","V",opt)
map("n","<tab>","%",opt)


map("t","<esc>","<C-\\><C-n>",opt)

--vim.api.nvim_eval('set shell=pwsh')
--
-- lua config
-- https://stackoverflow.com/questions/36108950/setting-up-powershell-as-vims-shell-command-does-not-seem-to-be-passed-correct

-- https://www.reddit.com/r/neovim/comments/pc7in0/detect_os_in_lua/
if jit.os=='Windows' then
vim.cmd([[
set shell=pwsh
set shellcmdflag=-command
set shellquote=\"
set shellxquote=
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
]])
end





return M
