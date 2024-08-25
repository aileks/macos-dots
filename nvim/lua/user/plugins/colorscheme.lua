return {
  'Shatur/neovim-ayu',
  config = function ()
    require('ayu').setup({
      overrides = {
        -- Transparency options
        Normal = { bg = "None" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        WhichKeyFloat = { bg = "None" },
        VertSplit = { bg = "None" },
      }
    })

    vim.cmd.colorscheme('ayu-dark')
  end
}
