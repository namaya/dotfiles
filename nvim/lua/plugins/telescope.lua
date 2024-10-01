return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>sf",       function() require "telescope.builtin".find_files() end,            mode = { "n" },      desc = "search files" },
    { "<leader>sp",       function() require "telescope.builtin".live_grep() end,             mode = { "n" },      desc = "search project" },
    { "<leader>sp",       function() require "telescope.builtin".grep_string() end,           mode = { "v" },      desc = "search project" },
    { "<leader>ss",       function() require "telescope.builtin".lsp_workspace_symbols() end, mode = { "n" },      desc = "search workspace symbols" },
    { "<leader>sb",       function() require "telescope.builtin".lsp_document_symbols() end,  mode = { "n" },      desc = "search buffer symbols" },
    { "<leader><leader>", function() require "telescope.builtin".oldfiles() end,              mode = { "n" },      desc = "search old files" },
    { "gd",               function() require "telescope.builtin".lsp_definitions() end,       mode = { "n" },      desc = "goto symbol definition" },
    { "<leader>pr",       function() require "telescope.builtin".lsp_implementations() end,   mode = { "n" },      desc = "peek references" },
    { "<C-r>",            function() require "telescope.builtin".command_history() end,       mode = { "n", "i" }, desc = "search command history" },
  }
}
