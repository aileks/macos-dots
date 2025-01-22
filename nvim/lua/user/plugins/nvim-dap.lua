return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      vim.keymap.set('n', '<leader>nb', ":lua require'dap'.toggle_breakpoint()<cr>")
      vim.keymap.set('n', '<leader>nc', ":lua require'dap'.continue()<cr>")
      vim.keymap.set('n', '<leader>no', ":lua require'dap'.step_over()<cr>")
      vim.keymap.set('n', '<leader>ni', ":lua require'dap'.step_into()<cr>")
      vim.keymap.set('n', '<leader>nq', ":lua require'dap'.step_out()<cr>")
      vim.keymap.set('n', '<leader>B', function()
        require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end)
    end,
  },
  {
    'mxsdev/nvim-dap-vscode-js',
    config = function()
      require('dap-vscode-js').setup({
        debugger_path = vim.fn.stdpath('data') .. "/lazy/vscode-js-debug",
        adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node' }
      })
      for _, language in ipairs({ 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' }) do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require 'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Start Chrome with \"localhost\"",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Mocha Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
              "./node_modules/mocha/bin/mocha.js",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          }
        }
      end
    end,
  }
}
