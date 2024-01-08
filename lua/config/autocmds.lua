-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local cmp = require("cmp")

local function augroup(name)
  return vim.api.nvim_create_augroup("customed_" .. name, { clear = true })
end

-- -- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("color_column_80"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    -- vim.opt_local.colorcolumn = "80"
    vim.opt_local.textwidth = 80
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("python_leetcode"),
  pattern = { "python" },
  callback = function()
    vim.opt_local.textwidth = 80
    -- vim.diagnostic.config({ underline = false, virtual_text = false, signs = false }, 47)
    -- vim.diagnostic.config({ underline = false, virtual_text = false, signs = false }, 48)
    vim.diagnostic.disable()
  end,
})

-- Temporary disable python diagnostic for leetcode

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("color_column_100"),
  pattern = { "lua" },
  callback = function()
    vim.opt_local.textwidth = 100
    vim.opt_local.colorcolumn = "100"
  end,
})

function SetAutoCmp(mode)
  if mode then
    cmp.setup({
      completion = {
        autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
      },
    })
  else
    cmp.setup({
      completion = {
        autocomplete = false,
      },
    })
  end
end
SetAutoCmp(false)

-- enable automatic completion popup on typing
vim.cmd("command AutoCmpOn lua SetAutoCmp(true)")

-- disable automatic competion popup on typing
vim.cmd("command AutoCmpOff lua SetAutoCmp(false)")
