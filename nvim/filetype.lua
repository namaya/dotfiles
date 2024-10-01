

-- https://neovim.io/doc/user/filetype.html#filetypes

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*Jenkinsfile",
  callback = function()
    -- https://neovim.io/doc/user/lua.html#vim.bo
    vim.bo.filetype = "groovy"
  end
})

