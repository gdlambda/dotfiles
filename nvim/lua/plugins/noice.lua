return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- Comment this out on Small Screens
    -- {
    --   "rcarriga/nvim-notify",
    --   config = function()
    --     require("notify").setup({
    --       background_colour = "#000000"
    --     })
    --   end,
    -- },
  }
}
