return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "python", "go", "groovy", "bash", "hcl" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true }
    })

    vim.treesitter.language.register('hcl', 'terraform')
  end
}
