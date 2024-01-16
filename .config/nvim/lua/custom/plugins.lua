local cmp = require "cmp"

local plugins = {
  -- tmux 
    {
      "christoomey/vim-tmux-navigator",
      lazy = false,
    },
  -- copilot 
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    opts = function ()
      return require "custom.configs.copilot"
    end,
    config = function(_, opts)
      require("copilot").setup(opts)
    end
  },
  -- debugger
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  -- LSP
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "isort",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "elixir-ls",
        "terraform-ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
{
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- "python"
        "python",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "json",

        -- functional programming
        "elixir",

       -- low level
        "c",
        -- devops
        "terraform",

      },
    },
  },

  }
return plugins
