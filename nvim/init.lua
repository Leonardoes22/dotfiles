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

  -- Only load plugins that define the vscode field as true.
  -- Took from https://github.com/Vourliotis/nvim.
  local defaults = require('lazy.core.config').defaults
  defaults.defaults = {
    cond = function(plugin)
        return plugin.vscode
      end,
  }

  require("code-settings")

end
  require("lazy").setup("plugins")
