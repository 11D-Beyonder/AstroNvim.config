local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

return {
  "hrsh7th/nvim-cmp",
  opts = function(_,opts)
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    return require("astronvim.utils").extend_tbl(opts, {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol_text",
          menu = ({
            buffer = "[Buffer]",
            path = "[Path]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
          })
        }),
      },
      mapping = {
        ["<CR>"] = cmp.config.disable,
        ["<Tab>"] = cmp.mapping(function (fallback)
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              cmp.confirm()
            end
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, {"i", "s", "c",}),
        ["<S-Tab>"] = cmp.mapping(function (fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" })
      }
    })
  end
}
