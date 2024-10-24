return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{
			"<leader>sf",
			function()
				require("telescope.builtin").find_files()
			end,
			mode = { "n" },
			desc = "search files",
		},
		{
			"<leader>sp",
			function()
				require("telescope.builtin").live_grep()
			end,
			mode = { "n" },
			desc = "search project",
		},
		{
			"<leader>sww",
			function()
				require("telescope.builtin").grep_string()
			end,
			mode = { "n", "v" },
			desc = "search with word",
		},
		{
			"<leader>ss",
			function()
				require("telescope.builtin").lsp_workspace_symbols({ symbols = { "function", "method", "class" } })
			end,
			mode = { "n" },
			desc = "search workspace symbols",
		},
		{
			"<leader>sb",
			function()
				require("telescope.builtin").lsp_document_symbols({ symbols = { "function", "method", "class" } })
			end,
			mode = { "n" },
			desc = "search buffer symbols",
		},
		{
			"<leader><leader>",
			function()
				require("telescope.builtin").buffers()
			end,
			mode = { "n" },
			desc = "search open buffers",
		},
		{
			"<leader>so",
			function()
				require("telescope.builtin").oldfiles()
			end,
			mode = { "n" },
			desc = "search old files",
		},
		{
			"gd",
			function()
				require("telescope.builtin").lsp_definitions()
			end,
			mode = { "n" },
			desc = "goto symbol definition",
		},
		{
			"<leader>pr",
			function()
				require("telescope.builtin").lsp_implementations()
			end,
			mode = { "n" },
			desc = "peek references",
		},
		{
			"<leader>sh",
			function()
				require("telescope.builtin").command_history()
			end,
			mode = { "n" },
			desc = "search command history",
		},
		{
			"gi",
			function()
				require("telescope.builtin").lsp_implementations()
			end,
			mode = { "n" },
			desc = "goto symbol implementation",
		},
		{
			"<leader>sgb",
			function()
				require("telescope.builtin").git_bcommits()
			end,
			mode = { "n" },
			desc = "search git uffer",
		},
	},
}
