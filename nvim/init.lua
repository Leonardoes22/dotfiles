require("vim-settings")
require("keymaps")
require("autocommands")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- VSCode extension
if vim.g.vscode then
  -- Remap folding keys
   vim.api.nvim_set_keymap('n', 'zM', '<Cmd>call VSCodeNotify("editor.foldAll")<CR>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('n', 'zR', '<Cmd>call VSCodeNotify("editor.unfoldAll")<CR>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('n', 'zc', '<Cmd>call VSCodeNotify("editor.fold")<CR>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('n', 'zC', '<Cmd>call VSCodeNotify("editor.foldRecursively")<CR>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('n', 'zo', '<Cmd>call VSCodeNotify("editor.unfold")<CR>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('n', 'zO', '<Cmd>call VSCodeNotify("editor.unfoldRecursively")<CR>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('n', 'za', '<Cmd>call VSCodeNotify("editor.toggleFold")<CR>', { noremap = true, silent = true })

  require("lazy").setup({
    {
      "lervag/vimtex",
      lazy = false,     -- Load immediately (not lazy-loaded)
      -- tag = "v2.15", -- Uncomment to pin to a specific release
      init = function()
      -- VimTeX configuration
        vim.g.vimtex_view_method = "zathura"
      end
    }
  })

else
  require("lazy").setup("plugins")
end
