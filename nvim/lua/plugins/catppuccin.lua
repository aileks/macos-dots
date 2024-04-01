return {
    {
      'catppuccin/nvim', name = 'catppuccin', priority = 1000,
      config = function()
        require('catppuccin').setup({
          transparent_background = true,
          integrations = {
            cmp = true,
            gitsigns = true,
            telescope = true,
            mason = true,
            treesitter = true,
            mini = {
                enabled = true,
                indentscope_color = 'mauve',
            },
            native_lsp = {
              enabled = true,
              virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
              },
              underlines = {
                  errors = { "underline" },
                  hints = { "underline" },
                  warnings = { "underline" },
                  information = { "underline" },
              },
              inlay_hints = {
                  background = true,
              },
            },
          }
        })
        vim.cmd.colorscheme('catppuccin')
      end
    }
}
