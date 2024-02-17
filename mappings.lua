local utils = require "astronvim.utils"
local is_available = utils.is_available
local maps = utils.empty_map_table()

maps.n["<Tab>"] = {
  function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
  desc = "Next buffer",
}
maps.n["<S-Tab>"] = {
  function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
  desc = "Previous buffer",
}

maps.n["<leader>bD"] = {
  function()
    require("astronvim.utils.status").heirline.buffer_picker(
      function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
    )
  end,
  desc = "Pick to close",
}

if is_available "todo-comments.nvim" then
  maps.n["<leader>ft"] = { "<cmd>TodoTelescope<CR>", desc = "Find TODO-like comments" }
end

if is_available "neoconf.nvim" then
  maps.n["<leader>n"] = { name = "Neoconf", desc = " Neoconf" }
  maps.n["<leader>n<CR>"] = { "<cmd>Neoconf<CR>", desc = "Select local&global neoconf" }
  maps.n["<leader>nl"] = { "<cmd>Neoconf local<CR>", desc = "Select local neoconf" }
  maps.n["<leader>ng"] = { "<cmd>Neoconf global<CR>", desc = "Select global neoconf" }
  maps.n["<leader>ni"] = { "<cmd>Neoconf show<CR>", desc = "Show merged neoconf" }
  maps.n["<leader>nL"] = { "<cmd>Neoconf lsp<CR>", desc = "show merged LSP config" }
end

return maps
