-- List of plugins that improve the editor experience.

return {
  -- https://github.com/numToStr/Comment.nvim#configuration-optional
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
      toggler = {
        line = "<M-/>"
      },
      opleader = {
        line = "<M-/>"
      }
    }
  },
  -- https://github.com/kylechui/nvim-surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }
}
