local plugins = {
  {
    -- Language Server Protocol support
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    -- depedencies manager
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "clangd", -- clangd is large, install it using native package manager
        "codelldb"
      }
    },
  },
  {
    -- telescope.nvim is a highly extendable fuzzy finder over lists.
    'nvim-telescope/telescope.nvim',
    lazy = true,
    -- tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require("custom.configs.telescope")
    end,
  },
  {
    -- Debug Adapter Protocol
    "mfussenegger/nvim-dap",
    config = function(_, _)
      -- load key map, located in mappings.lua#dap
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    -- 
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    depedencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    -- UI for debugger
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "custom.configs.nvimdapui"
    end
  },
  {
    -- A library for asynchronous IO in Neovim
    "nvim-neotest/nvim-nio",
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
      require "custom.configs.autosession"
    end
  },
--  {
    --'mrcjkb/rustaceanvim',
    --version = '^5', -- Recommended
    --lazy = false, -- This plugin is already lazy
  --},
}

return plugins
