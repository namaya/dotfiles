-- local hour = tonumber(os.date("%H"))
--
-- if hour < 6 or hour > 18 then
--     vim.opt.background = "dark"
-- else
--     vim.opt.background = "light"
-- end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        background = {
          light = "latte",
        },
      })

      vim.cmd("colorscheme catppuccin")
    end,
  },
  { "folke/tokyonight.nvim" },
}
