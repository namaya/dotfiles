--
-- # keymap settings
--

--
-- ## global variables
--
-- * https://neovim.io/doc/user/lua.html#vim.g
-- * https://neovim.io/doc/user/map.html#mapleader
--

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--
--  ## keymaps
--
--  * https://neovim.io/doc/user/lua.html#vim.keymap
--

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- buffer navigation

vim.keymap.set("n", "}", ":bnext<CR>")
vim.keymap.set("n", "{", ":bprev<CR>")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set({ "n", "i", "v" }, "<C-w>|", ":vsplit<CR><C-w>l")
vim.keymap.set({ "n", "i", "v" }, "<C-w>-", ":split<CR><C-w>j")
-- vim.keymap.set({ "n", "i", "v" }, "<D-s>", ":w<CR>")
vim.keymap.set({ "n", "i", "v" }, "<M-a>", "ggVG")

vim.keymap.set({ "v" }, "c", '"*y')
