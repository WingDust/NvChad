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
M.disabled ={
  i = {
    
      -- go to  beginning and end
      ["<C-b>"] = "",
                  "",
      -- navigate 
      ["<C-h>"] = "",
      ["<C-l>"] = "",
      ["<C-j>"] = "",
      ["<C-k>"] = "",
  }
}

M.mappings ={
-- navigation in insert mode, only if enabled in options
--  insert_nav = {
--     backward          = {"<C-b>","backward"},
--     end_of_line       = {"<C-e>","end_of_line"},
--     forward           = {"<C-f>","forward"},
--     next_line         = {"<C-n>","next_line"},
--     prev_line         = {"<C-p>","prev_line"},
--     beginning_of_line = {"<C-a>","beginning_of_line"},
--  },
--
-- 它这里的emacs 是一个用户定义的名字，
  emacs ={
    i ={
        ["<C-a>"] = { "<ESC>^i", "home" },
        ["<C-b>"] = { "<Left>", "back" },
        ["<C-f>"] = { "<Left>", "forward" },
        ["<C-p>"] = { "<Up>", "previous" },
        ["<C-n>"] = { "<Down>", "next" },
    }
  },
  terminal ={
   --esc_termmode={ "<esc>"}
  },
disabled = {
  i = {
    
      -- go to  beginning and end
      ["<C-b>"] = "",
                  "",
      -- navigate 
      ["<C-h>"] = "",
      ["<C-l>"] = "",
      ["<C-j>"] = "",
      ["<C-k>"] = "",
  }
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
if jit.os=='Windows' 
  then
    -- [How to configure what :! commands call in neovim?](https://www.reddit.com/r/neovim/comments/li8hur/how_to_configure_what_commands_call_in_neovim/)
  vim.cmd([[
  set shell=pwsh\ -NoLogo shellpipe=\| shellxquote=
    set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
    set shellredir=\|\ Out-File\ -Encoding\ UTF8
  set shellredir=\|\ Out-File\ -Encoding\ UTF8

nnoremap <silent> za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
nnoremap <silent> zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
nnoremap <silent> zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
nnoremap <silent> zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>

nnoremap <silent> z1 <Cmd>call VSCodeNotify('editor.foldLevel1')<CR>
nnoremap <silent> z2 <Cmd>call VSCodeNotify('editor.foldLevel2')<CR>
nnoremap <silent> z3 <Cmd>call VSCodeNotify('editor.foldLevel3')<CR>
nnoremap <silent> z4 <Cmd>call VSCodeNotify('editor.foldLevel4')<CR>
nnoremap <silent> z5 <Cmd>call VSCodeNotify('editor.foldLevel5')<CR>
nnoremap <silent> z6 <Cmd>call VSCodeNotify('editor.foldLevel6')<CR>
nnoremap <silent> z7 <Cmd>call VSCodeNotify('editor.foldLevel7')<CR>

xnoremap <silent> zV <Cmd>call VSCodeNotify('editor.foldAllExcept')<CR>


  autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
  ]])
else

  vim.cmd([[
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
