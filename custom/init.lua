-- example file i.e lua/custom/init.lua

-- load your globals, autocmds here or anything .__.


-- 本地变量
--local map = vim.api.nvim_set_keymap

--map("v","v","V",opt)
--map("n","<Tab>","%",opt)


--map("t","<esc>","<C-\\><C-n> ",opt)


-------------------按键映射---------------------
local map = require("core.utils").map

map('v','v','V')
map('n','<TAB>','%')
--map("t","<ESC>","<C-\\><C-N>")


require "custom.global"
