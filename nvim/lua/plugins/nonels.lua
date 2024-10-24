--
-- none-ls settings
--
-- none-ls is a plugin that hooks binary exectuables into the neovim lsp client.
-- For more info, see: https://www.reddit.com/r/neovim/comments/13sdxep/comment/jlqzqmr/
--

return {
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason").setup({})
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"black",
					"gofmt",
					"terraform_fmt",
				},
				automatic_installation = false,
				handlers = {},
			})

			local nonels = require("null-ls")

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			nonels.setup({
				sources = {
					--          nonels.builtins.formatting.stylua, -- lua
					--          nonels.builtins.formatting.black,  -- python
					--          nonels.builtins.formatting.gofmt,  -- golang
				},
				-- format on save
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})
		end,
	},
}
