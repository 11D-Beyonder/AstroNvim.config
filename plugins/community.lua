return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.pack.json" },

  { import = "astrocommunity.pack.lua" },

  -- python支持
  { import = "astrocommunity.pack.python" },
  {
    "linux-cultist/venv-selector.nvim",
    ft = "python",
    opts = {
      anaconda_base_path = "~/miniconda3",
      anaconda_envs_path = "~/miniconda3/envs",
    },
  },

  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },

  { import = "astrocommunity.colorscheme.catppuccin" },
}
