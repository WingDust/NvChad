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
set shell=pwsh\ -NoLogo shellpipe=\| shellxquote=
  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
  set shellredir=\|\ Out-File\ -Encoding\ UTF8
set shellredir=\|\ Out-File\ -Encoding\ UTF8
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
]])
end

--set shellcmdflag= '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
--set shellxquote="{"
--set shell=pwsh

--set shellquote= \"
--set shellquote= shellxquote=
--set shellxquote=

local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

vim.api.nvim_create_user_command(
  'OpenURL', 
  function(opts) 
    print(opts)
    print(get_visual_selection())

    -- cmd = ("open itter.js")
    -- os.execute(cmd)
  end,
  { nargs = '*' }
  )



return M
