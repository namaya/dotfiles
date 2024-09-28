return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set({ "n", "i", "v" }, "<D-p>", builtin.find_files, { desc = "search file names" })
        vim.keymap.set({ "n", "v" }, "<leader>ps", builtin.live_grep, { desc = "search file contents" })
        vim.keymap.set({ "n", "i", "v" }, "<D-o>", builtin.lsp_workspace_symbols, { desc = "search ctags" })
        vim.keymap.set({ "n", "i", "v" }, "<D-O>", builtin.lsp_document_symbols, { desc = "search current buffer ctags" })
    end
}
