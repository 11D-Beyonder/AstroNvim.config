return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-cmdline",
      config = require "user.plugins.configs.cmp-cmdline",
    },
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
    })
  end,
}
