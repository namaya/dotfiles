

vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>")
-- vim.keymap.set("t",  "<esc>", "<C-\\><C-n>")

local function on_open(term)
    vim.cmd("startinsert!")
    vim.keymap.set("n", "q", ":q", { buffer=term.bufnr })
    vim.keymap.set("t",  "<C-q>", "<C-\\><C-n>:q<CR>", { buffer=term.bufnr })
end

local function width()
    return math.floor(vim.api.nvim_win_get_width(0) * 0.8)
end

local function height()
    return math.floor(vim.api.nvim_win_get_height(0) * 0.8)
end

return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},
    config = function()
        require("toggleterm").setup {
            direction = "float",
            on_open = on_open,
            float_opts = {
                border = "double",
                width = width,
                height = height,
            }
        } -- setup :ToggleTerm commands

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

        local function lazygit_toggle()
            lazygit:toggle()
        end

        vim.keymap.set("n", "<leader>g", lazygit_toggle)
    end
}

