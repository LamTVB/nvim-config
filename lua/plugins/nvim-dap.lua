-- Description: Configuration for nvim-dap, a debugging plugin for Neovim.
-- This file sets up the DAP adapter for Node.js, configures DAP UI, and binds keys for debugging actions.
-- Related sources:
--  - https://www.johntobin.ie/blog/debugging_in_neovim_with_nvim-dap/#using-the-debugger
--  - https://tamerlan.dev/a-guide-to-debugging-applications-in-neovim/
--  - https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#vscode-js-debug
return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  config = function(config)
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.adapters["pwa-node"] = {
      type = 'server',
      host = "localhost",
      port = "${port}",
      executable = {
        command = 'node',
        args = { os.getenv('HOME') .. "/dev/microsoft/js-debug/src/dapDebugServer.js", "${port}" }
      }
    }

    dap.configurations = {
      typescript = {
        {
          name = 'Launch',
          type = 'pwa-node',
          request = 'launch',
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
        {
          -- For this to work you need to make sure the node process is started with the `--inspect` flag.
          name = 'Attach to process',
          type = 'pwa-node',
          request = 'attach',
          processId = require 'dap.utils'.pick_process,
        },
      },
    }
  end,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    {
      "<leader>db",
      function() require("dap").toggle_breakpoint() end,
      desc = "Toggle Breakpoint"
    },
    {
      "<leader>dc",
      function() require("dap").continue() end,
      desc = "Continue"
    },
    {
      "<leader>dC",
      function() require("dap").run_to_cursor() end,
      desc = "Run to Cursor"
    },
    {
      "<leader>dT",
      function() require("dap").terminate() end,
      desc = "Terminate"
    },
    {
      "<leader>dS",
      function() require("dap").step_into() end,
      desc = "Step Into"
    },
    {
      "<leader>ds",
      function() require("dap").step_over() end,
      desc = "Step Over"
    },
    {
      "<leader>do",
      function() require("dap").step_out() end,
      desc = "Step Out"
    },
    {
      "<leader>dn",
      function() vim.cmd('DapNew') end,
      desc = "New DAP Session"
    }
  }
}
