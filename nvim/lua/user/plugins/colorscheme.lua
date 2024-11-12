return {
  'Mofiqul/dracula.nvim',
  config = function ()
    require('dracula').setup({
      transparent_bg = true
    })

    vim.cmd.colorscheme('dracula')
  end
}
