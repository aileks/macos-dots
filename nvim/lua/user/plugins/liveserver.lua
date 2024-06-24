return {
  "barrett-ruth/live-server.nvim",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = function()
    require("live-server").setup()
  end,
}
