-- custom/plugins/init.lua

return {

   --["elkowar/yuck.vim"] = { ft = "yuck" }
-- ["hkupty/nvimux"] ={
---- config = function ()
------ require("nvimux")
-------- code
--  local present, nvimux = pcall(require, "nvimux")
--  if not present then
--    return
--  end
--    nvimux.setup(
--       config = {
--        prefix = '<C-a>',
--      },
--      bindings = {
--        {{'n', 'v', 'i', 't'}, 's', nvimux.commands.horizontal_split},
--        {{'n', 'v', 'i', 't'}, 'v', nvimux.commands.vertical_split},
--      }
--    )
--     end,

--  },
    ["nvim-treesitter/nvim-treesitter"] ={
      disable=true
    },
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["SmiteshP/nvim-gps"]={
      disable=true
  }
}
