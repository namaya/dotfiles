return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false,
  init = function()
    -- open neotree when a directory is opened in neovim
    vim.api.nvim_create_autocmd('BufEnter', {
      group = vim.api.nvim_create_augroup('NeoTreeInit', { clear = true }),
      callback = function()
        local f = vim.fn.expand('%:p')
        if vim.fn.isdirectory(f) ~= 0 then
          vim.cmd('Neotree position=float current dir=' .. f)
          vim.api.nvim_clear_autocmds { group = 'NeoTreeInit' }
        end
      end
    })

    -- keymaps
    vim.keymap.set("n", "<leader>vf", ":Neotree position=right reveal=true<cr>",
      { desc = "view files" })
    vim.keymap.set("n", "<leader>qf", ":Neotree position=float reveal=true<cr>",
      { desc = "quick files" })
  end,
  opts = {
    window = {
      position = "right",
      mappings = {
        ["u"] = function(state)
          local node = state.tree:get_node()
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end,
      }
    },
    filesystem = {
      hijack_netrw_behavior = "open_current"
    }
  },
  -- keys = {
  --   "<leader>vf", ":Neotree position=right reveal=true<cr>"
  --   "<leader>qf", ":Neotree position=float reveal=true<cr>"
  -- }
}
