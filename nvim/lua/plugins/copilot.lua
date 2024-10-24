-- Github Copilot
-- https://github.com/zbirenbaum/copilot.lua

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<cr>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "right", -- bottom | top | left | right
					ratio = 0.3,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<C-e>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			copilot_node_command = "node", -- Node.js version must be > 18.x
			server_opts_overrides = {},
		},
	},
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			branch = "canary",
			dependencies = {
				{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
				{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
			},
			build = "make tiktoken", -- Only on MacOS or Linux
			init = function()
				-- vim.api.nvim_create_autocmd('BufEnter', {
				--   pattern = 'copilot-*',
				--   callback = function()
				--       --  vim.opt_local.relativenumber = true
				--
				--       -- C-p to print last response
				--       vim.keymap.set('n', '<C-p>', function() print(require("CopilotChat").response()) end, { buffer = true, remap = true })
				--       vim.keymap.set("n", '<esc>', ":q<cr>", { buffer = true, remap = true })
				--   end
				-- })
			end,
			opts = {
				debug = true,
				auto_insert_mode = true,
				window = {
					layout = "float",
					width = 0.5,
					height = 1,
				},
				mappings = {
					close = {
						normal = "<C-c>",
						insert = "<C-c>",
					},
					submit_prompt = {
						normal = "<cr>",
						insert = "<cr>",
					},
				},
				-- See Configuration section for rest
			},
			-- config = function(_, opts)
			--   local chat = require("CopilotChat")
			--   local select = require("CopilotChat.select")
			--
			--   chat.setup(opts)
			--
			--   vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
			--     chat.ask(args.args, { selection = select.buffer })
			--   end, { nargs = "*", range = true })
			-- end,
			keys = {
				-- Chat with Copilot
				{ "<leader>cc", ":CopilotChat<cr>", desc = "CopilotChat - Quick chat" },
				{
					"<leader>qq",
					function()
						local input = vim.fn.input("Quick Chat: ")
						if input ~= "" then
							require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
						end
					end,
					desc = "CopilotChat - Quick question",
				},
			},
		},
	},
}
