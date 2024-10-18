return {
  'weedatom/presence.nvim',
  config = function ()
    require('presence').setup({
      neovim_image_text = "That's classifed",
      main_image = 'file',
      enable_line_number = true,
    })
  end
}
