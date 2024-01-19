-- lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'tpope/vim-fugitive', dependencies = 'tpope/vim-rhubarb' },
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-sleuth' },
  { 'farmergreg/vim-lastplace' },
  { 'nelstrom/vim-visual-star-search' },
  { 'whatyouhide/vim-textobj-xmlattr', dependencies = 'kana/vim-textobj-user'  },
  { 'jessarcher/vim-heritage' },
  { 'windwp/nvim-autopairs', config = true },
  { 'karb94/neoscroll.nvim', config = true },
  { 'hiphish/rainbow-delimiters.nvim' },
  { import = 'user.plugins.vim-rooter' },
  { import = 'user.plugins.bufdelete' },
  { import = 'user.plugins.rose-pine' },
  { import = 'user.plugins.vim-commentary' },
  { import = 'user.plugins.treesj' },
  { import = 'user.plugins.vim-pasta' },
  { import = 'user.plugins.telescope' },
  { import = 'user.plugins.neo-tree' },
  { import = 'user.plugins.lualine' },
  { import = 'user.plugins.indent-blankline' },
  { import = 'user.plugins.gitsigns' },
  { import = 'user.plugins.floaterm' },
  { import = 'user.plugins.treesitter' },
  { import = 'user.plugins.lspconfig' },
  { import = 'user.plugins.cmp' },
  { import = 'user.plugins.phpactor' },
  { import = 'user.plugins.vim-test' },
  { import = 'user.plugins.copilot' },
  { import = 'user.plugins.colorizer' },
  { import = 'user.plugins.illuminate' },
  { import = 'user.plugins.which-key' },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  install = {
    colorscheme = { "rose-pine-moon" },
  },
})
