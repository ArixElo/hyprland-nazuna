-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Copy to system clipboard using the '+' register
vim.opt.clipboard = "unnamedplus"

-- Disable auto-formatting when pasting so it doesn't mangle indentation
vim.opt.paste = true

-- Turn off paste mode when leaving insert mode so normal typing isn't affected
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})
