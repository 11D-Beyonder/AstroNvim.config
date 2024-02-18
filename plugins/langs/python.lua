local utils = require "astronvim.utils"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "python", "toml" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "pyright" }) end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "black", "isort" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "python")
      if not opts.handlers then opts.handlers = {} end
      -- NOTE: make sure python doesn't get set up by mason-nvim-dap,
      -- it's being set up by nvim-dap-python
      opts.handlers.python = function() end
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    cmd = { "VenvSelect", "VenvSelectCached" },
    opts = {
      anaconda_base_path = "~/miniconda3",
      anaconda_envs_path = "~/miniconda3/envs",
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    -- NOTE: ft: lazy-load on filetype
    ft = "python",
    config = function(_, opts)
      local path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
      require("dap-python").setup(path, opts)
    end,
  },
}
