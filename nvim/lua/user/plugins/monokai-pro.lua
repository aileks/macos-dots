return {
    {
      "loctvl842/monokai-pro.nvim",
      config = function()
        require("monokai-pro").setup({
          italic_comments = true,
          italic_keywords = true,
          italic_functions = true,
          italic_variables = true,
          contrast = true,
          borders = false,
          background_clear = { "float_win" }
        })

        vim.cmd("colorscheme monokai-pro-octagon")
      end,
    }
}
