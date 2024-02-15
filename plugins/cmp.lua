return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      formatting = {
        format = require("lspkind").cmp_format {
          mode = "symbol_text",
          menu = {
            buffer = "[Buffer]",
            path = "[Path]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
          },
        },
      },
    })
  end,
}
