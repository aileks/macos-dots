return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require('harpoon')
    local conf = require('telescope.config').values
    harpoon:setup({})

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })
    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-A-p>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-A-n>", function() harpoon:list():next() end)
  end
}
