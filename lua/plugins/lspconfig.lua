return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
  },
  config = function()
    local cmp = require'cmp'
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      }
    })
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    vim.lsp.config("tailwindcss", {
      capabilities = capabilities
    })
    vim.lsp.config("ruby_lsp", {
      capabilities = capabilities,
    })
    vim.lsp.config("gopls", {
      capabilities = capabilities,
    })
    vim.lsp.config("elixirls", {
      capabilities = capabilities,
    })
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT"
          },
          format = {
            indent_style = "space",
            indent_size = "2",
          },
          workspace = {
            userThirdParty = "/home/trevor/workspace/lls-addons",
          },
          library = {
            [vim.fn.expand("/home/trevor/workspace/lls-addons/addons/love2d")] = true,
          },
          globals = { "love", "vim" },
          diagnostics = {
            globals = { "love", "vim" }
          }
        }
      }
    })

    vim.lsp.config("zls", {
      capabilities = capabilities,
      cmd = { "zls" },
      on_attach = function(client, bufnr)
        -- Enable format on save
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
      settings = {
        zls = {
          enable_build_on_save = true,
          build_on_save_step = "check",  -- This runs 'zig build check'
          -- Or if you have a custom step defined in build.zig:
          -- build_on_save_step = "your_custom_step",
        },
      },
    })
  end,
}
