return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-cmdline",
      lazy = false,
      config = function()
        local cmp = require "cmp"
        local mapping = {
          -- https://github.com/hrsh7th/cmp-cmdline/issues/42
          -- https://github.com/hrsh7th/cmp-cmdline/issues/31
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }, { "i", "c" }),
          ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }, { "i", "c" }),
          ["<CR>"] = cmp.mapping(cmp.mapping.confirm { select = true }, { "i", "c" }),
        }
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
