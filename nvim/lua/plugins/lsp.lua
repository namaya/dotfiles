
return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            --
            -- Configuration files to hook into the Neovim LSP client.
            --
            -- For more information, see https://github.com/neovim/nvim-lspconfig .
            --
            { "neovim/nvim-lspconfig" },
            --
            -- Neovim package manager for LSP servers, linters, and formatters.
            --
            -- For more information, see  https://github.com/williamboman/mason.nvim .
            --
            { "williamboman/mason.nvim" }
        },
        config = function()
            require("mason").setup {}
            require("mason-lspconfig").setup {
                ensure_installed = { "lua_ls", "pyright", "gopls" }
            }

            local lspconfig = require "lspconfig"

            -- Golang
            lspconfig.gopls.setup {}
            
            vim.api.create_nvim_autocmd("BufWritePre", {
              pattern = "*.go",
              callback = function()
                local params = vim.lsp.util.make_range_params()
                params.context = {only = {"source.organizeImports"}}
                -- buf_request_sync defaults to a 1000ms timeout. Depending on your
                -- machine and codebase, you may want longer. Add an additional
                -- argument after params if you find that you have to write the file
                -- twice for changes to be saved.
                -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
                for cid, res in pairs(result or {}) do
                  for _, r in pairs(res.result or {}) do
                    if r.edit then
                      local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                      vim.lsp.util.apply_workspace_edit(r.edit, enc)
                    end
                  end
                end
                vim.lsp.buf.format({async = false})
              end
            })

      lspconfig.gopls.setup {}
      lspconfig.pyright.setup {}
      lspconfig.lua_ls.setup {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                -- Depending on the usage, you might want to add additional paths here.
                "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          })
        end,
        settings = {
          Lua = {}
        }
      }
    end
  }
}
