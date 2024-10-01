local function on_open(term)
  vim.cmd("startinsert!")
  vim.keymap.set("n", "<esc><esc>", ":q<CR>", { buffer = term.bufnr })
  vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>:q<CR>", { buffer = term.bufnr })
end

local function width()
  return math.floor(vim.api.nvim_win_get_width(0) * 0.8)
end

local function height()
  return math.floor(vim.api.nvim_win_get_height(0) * 0.8)
end

-- TODO: close a terminal with <esc>
-- TODO: kill a terminal with <C-c>
-- TODO: quickterm should have a different state

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    direction = "float",
    on_open = on_open,
    float_opts = {
      border = "double",
      width = width,
      height = height,
    }
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>:q<CR>")

    -- dedicated lazygit terminal
    local Terminal = require('toggleterm.terminal').Terminal

    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      display_name = "lazygit",
      direction = "float",
      float_opts = {
        border = "double",
        width = width,
        height = height,
      },
      on_open = on_open,
    })

    function lazygit_toggle()
      lazygit:toggle()
    end
  end,
  keys = {
    { "<leader>vlg", function() lazygit_toggle() end,                                                      desc = "view lazygit terminal" },
    { "<leader>vt",  function() require "toggleterm".toggle(nil, nil, nil, "horizontal", "quickterm") end, desc = "view horizontal terminal" },
    { "<leader>vqt", function() require "toggleterm".toggle(nil, nil, nil, "float", "quickterm") end,      desc = "view quick terminal" },
    { "<leader>vht", function() require "toggleterm".toggle(nil, nil, nil, "horizontal", "hterm") end,     desc = "view horizontal terminal" },
    { "<leader>vvt", function() require "toggleterm".toggle(nil, nil, nil, "vertical", "vterm") end,       desc = "view horizontal terminal" },
  }
}
