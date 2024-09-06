return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    { 'nvimtools/none-ls.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    'jayp0521/mason-null-ls.nvim',
    'MunifTanjim/prettier.nvim',
  },
  config = function()
    require('mason').setup({
      ui = {
        height = 0.8,
      },
    })

    require('mason-lspconfig').setup({ automatic_installation = true })
    require('mason-null-ls').setup({ automatic_installation = true })

    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.buf.inlay_hint(bufnr, true)
        -- end
      end,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
          },
        },
      },
    })

    -- Python
    lspconfig.pyright.setup({
      capabilities = capabilities,
      filetypes = { "python" },
      settings = {
        pyright = {
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            ignore = { '*' },
          },
        },
      },
    })
    lspconfig.ruff_lsp.setup({
      capabilities = capabilities,
      filetypes = { "python" },
      init_options = {
        settings = {
          lineLength = 80,
          logLevel = "error",
          lint = {
            select = { "E", "F", "N", "C4", "RUFF" }
          }
        }
      },
      on_attach = function(client, bufnr)
        client.server_capabilities.hoverProvider = false
      end
    })

    -- PHP
    lspconfig.intelephense.setup({
      commands = {
        IntelephenseIndex = {
          function()
            vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
          end,
        },
      },
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.buf.inlay_hint(bufnr, true)
        end
      end,
      capabilities = capabilities
    })

    -- TypeScript
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.buf.inlay_hint(bufnr, true)
        -- end
      end,
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    })

    -- JSON
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    })

    -- Emmet
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      filetypes = { "css", "eruby", "html", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
      init_options = {
        html = {
          options = {
            ["bem.enabled"] = true,
          },
        },
      }
    })

    -- CSS
    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
      end,
    })

    -- Tailwind
    lspconfig.tailwindcss.setup({ capabilities = capabilities })

    -- none-ls
    local null_ls = require('null-ls')
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      temp_dir = '/tmp',
      sources = {
        null_ls.builtins.formatting.pint.with({
          condition = function(utils)
            return utils.root_has_file({ 'vendor/bin/pint' })
          end,
        }),
        null_ls.builtins.formatting.prettierd.with({
          condition = function(utils)
            return utils.root_has_file({ '.prettierrc', '.prettierrc.json', '.prettierrc.yml', '.prettierrc.js',
              'prettier.config.js' })
          end,
        }),
        -- null_ls.builtins.formatting.black,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
            end,
          })
        end
      end,
    })

    -- Prettier
    require('prettier').setup({
      bin = 'prettierd',
      cli_options = {
        arrow_parens = 'avoid',
        jsx_single_quote = true,
        print_width = 100,
        single_attribute_per_line = true,
        single_quote = true,
        vue_indent_script_and_style = true,
      },
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'html',
        'css',
        'scss',
        'json',
        'yaml',
        'markdown',
      },
    })

    require('mason-null-ls').setup({ automatic_installation = true })

    -- Keymaps
    vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>', { silent = true })
    vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', { silent = true })
    vim.keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<leader>lr', ':LspRestart<CR>', { silent = true })
    vim.keymap.set('n', '<leader>lf', ':Format<CR>', { silent = true })
    vim.keymap.set('n', '<leader>lp', ':Prettier<CR>', { silent = true })
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    vim.keymap.set('i', '<M-h>', function() vim.lsp.buf.signature_help() end, opts)

    -- Commands
    vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        source = true,
      }
    })

    -- Sign configuration
    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
  end,
}
