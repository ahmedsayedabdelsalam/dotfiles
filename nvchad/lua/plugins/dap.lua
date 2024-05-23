return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "suketa/nvim-dap-ruby"
    },
    config = function()
      local dap = require "dap"
      local registry = require "mason-registry"

      require("dap-ruby").setup()

      -- dap.set_log_level('TRACE')

      dap.adapters.php = {
        type = "executable",
        command = registry.get_package("php-debug-adapter"):get_install_path() .. "/php-debug-adapter",
      }
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug locally",
          repl_lang = "php_only",
        },
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug in Docker",
          pathMappings = {
            ["/var/www"] = "${workspaceFolder}",
          },
          repl_lang = "php_only",
        },
      }

      vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "" })
      vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "" })

      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "debugPC", numhl = "" })

      local icons = {
        Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
        Breakpoint = " ",
        BreakpointCondition = " ",
        BreakpointRejected = { " ", "DiagnosticError" },
        LogPoint = ".>",
      }

      for name, sign in pairs(icons) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,

    -- stylua: ignore
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
  },

  {
    "mxsdev/nvim-dap-vscode-js",
    opts = {
      debugger_path = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter",
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    },
    dependencies = { "mfussenegger/nvim-dap" },
  },

  {
    "rcarriga/nvim-dap-ui",
    opts = {},
    config = function(_, opts)
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup(opts)

      local open = function()
        dapui.open()
      end

      local close = function()
        dapui.close()
      end

      dap.listeners.before.attach.dapui_config = open
      dap.listeners.before.launch.dapui_config = open
      dap.listeners.before.disconnect.dapui_config = close
      dap.listeners.before.event_terminated.dapui_config = close
      dap.listeners.before.event_exited.dapui_config = close
      dap.listeners.after.event_initialized.dapui_config = open
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    -- stylua: ignore
    keys = {
      { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
    },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },

  {
    "LiadOz/nvim-dap-repl-highlights",
    opts = {},
  },
}
