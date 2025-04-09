-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Better exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
-- vim.keymap.set("x", "jk", "<Esc>", { noremap = true, silent = true })  -- This bugs vscode selection

if vim.g.vscode then
  local vscode_notify = function(command)
    return "<Cmd>call VSCodeNotify('" .. command .. "')<CR>"
  end
  vim.keymap.set("n", "<LEADER>cf", vscode_notify("editor.action.formatDocument"))
end
