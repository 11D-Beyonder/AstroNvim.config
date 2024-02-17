return function()
  local cmp = require "cmp"
  local mapping = {
    -- https://github.com/hrsh7th/cmp-cmdline/issues/42
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
end
