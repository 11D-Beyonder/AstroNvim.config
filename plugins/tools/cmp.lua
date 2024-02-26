return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-cmdline",
      lazy = false,
      config = function()
        local cmp = require "cmp"
        local mapping = cmp.mapping.preset.cmdline()
        cmp.setup.cmdline("/", {
          mapping = mapping,
          sources = {
            { name = "buffer" },
          },
        })
        cmp.setup.cmdline(":", {
          mapping = mapping,
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }),
        })
      end,
    },
    "kdheepak/cmp-latex-symbols",
  },
  opts = {
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
      { name = "nvim_lsp", priority = 9 },
      { name = "luasnip", priority = 8 },
      { name = "buffer", priority = 7 },
      { name = "path", priority = 6 },
      { name = "latex_symbols", priority = 5, option = { strategy = 0 } },
    },
  },
}
