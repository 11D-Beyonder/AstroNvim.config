return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-cmdline",
      lazy = false,
      config = require "user.plugins.configs.cmp-cmdline",
    },
    "kdheepak/cmp-latex-symbols",
  },
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      completion = {
        completeopt = "menu,menuone,noinsert,preview",
      },
      formatting = {
        format = require("lspkind").cmp_format {
          mode = "symbol_text",
          menu = {
            buffer = "[Buffer]",
            path = "[Path]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            cmdline = "[Cmd]",
          },
        },
      },
      sources = require("cmp").config.sources {
        { name = "nvim_lsp",      priority = 9 },
        { name = "luasnip",       priority = 8 },
        { name = "buffer",        priority = 7 },
        { name = "path",          priority = 6 },
        { name = "latex_symbols", priority = 5, option = { strategy = 0 } },
      },
    })
  end,
}
