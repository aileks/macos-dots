return {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({ background_colour = "#000000", top_down = false })
      vim.notify = notify.notify
    end
}
