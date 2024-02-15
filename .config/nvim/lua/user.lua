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
    { import = 'plugins.autopairs' },
    { import = 'plugins.cmp' },
    { import = 'plugins.colorizer' },
    { import = 'plugins.copilot' },
    { import = 'plugins.emmet' },
    { import = 'plugins.floaterm' },
    { import = 'plugins.illuminate' },
    { import = 'plugins.indent-blankline' },
    { import = 'plugins.laravel' },
    { import = 'plugins.lspconfig' },
    { import = 'plugins.lualine' },
    { import = 'plugins.neo-tree' },
    { import = 'plugins.noice' },
    { import = 'plugins.nvim-notify' },
    { import = 'plugins.phpactor' },
    { import = 'plugins.projectionist' },
    { import = 'plugins.rose-pine' },
    { import = 'plugins.telescope' },
    { import = 'plugins.transparant' },
    { import = 'plugins.treesitter' },
    { import = 'plugins.treesj' },
    { import = 'plugins.ts-autotag' },
    { import = 'plugins.vim-commentary' },
    { import = 'plugins.vim-pasta' },
    { import = 'plugins.vim-rooter' },
    { import = 'plugins.vim-test' },
})
