-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "astronvim.utils"
local is_available = utils.is_available
local get_icon = utils.get_icon
local sections = {
  f = { desc = get_icon("Search", 1, true) .. "Find" },
  p = { desc = get_icon("Package", 1, true) .. "Packages" },
  l = { desc = get_icon("ActiveLSP", 1, true) .. "LSP" },
  u = { desc = get_icon("Window", 1, true) .. "UI/UX" },
  b = { desc = get_icon("Tab", 1, true) .. "Buffers" },
  bs = { desc = get_icon("Sort", 1, true) .. "Sort Buffers" },
  d = { desc = get_icon("Debugger", 1, true) .. "Debugger" },
  g = { desc = get_icon("Git", 1, true) .. "Git" },
  S = { desc = get_icon("Session", 1, true) .. "Session" },
  t = { desc = get_icon("Terminal", 1, true) .. "Terminal" },
}

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

-- Neoconf
maps.n["<leader>n"] = { name = "Neoconf", desc = " Neoconf" }
if is_available "neoconf.nvim" then
  maps.n["<leader>n<CR>"] = { "<cmd>Neoconf<CR>", desc = "Select local&global neoconf" }
  maps.n["<leader>nl"] = { "<cmd>Neoconf local<CR>", desc = "Select local neoconf" }
  maps.n["<leader>ng"] = { "<cmd>Neoconf global<CR>", desc = "Select global neoconf" }
  maps.n["<leader>ni"] = { "<cmd>Neoconf show<CR>", desc = "Show merged neoconf" }
  maps.n["<leader>nL"] = { "<cmd>Neoconf lsp<CR>", desc = "show merged LSP config" }
end

return maps
