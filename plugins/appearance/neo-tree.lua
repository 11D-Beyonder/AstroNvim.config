return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_hidden = true,
          show_hidden_count = true,
          hide_gitignored = false,
          always_show = {
            ".gitignore",
            ".neoconf.json",
          },
        },
      },
    })
  end,
}
