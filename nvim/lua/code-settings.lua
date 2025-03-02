local vscode_notify = function(command)
	return "<Cmd>call VSCodeNotify('" .. command .. "')<CR>"
end

-- Search (Telescope alternative)
vim.keymap.set("n", "<LEADER>sf", vscode_notify("workbench.action.quickOpen"))
vim.keymap.set("n", "<LEADER>sg", vscode_notify("workbench.action.findInFiles"))
vim.keymap.set("n", "<LEADER><LEADER>", vscode_notify("workbench.action.showAllEditorsByMostRecentlyUsed"))
vim.keymap.set("n", "<LEADER>sk", vscode_notify("workbench.action.showCommands"))

-- Remap folding keys using
vim.keymap.set("n", "zM", vscode_notify("editor.foldAll"), { noremap = true, silent = true })
vim.keymap.set("n", "zR", vscode_notify("editor.unfoldAll"), { noremap = true, silent = true })
vim.keymap.set("n", "zc", vscode_notify("editor.fold"), { noremap = true, silent = true })
vim.keymap.set("n", "zC", vscode_notify("editor.foldRecursively"), { noremap = true, silent = true })
vim.keymap.set("n", "zo", vscode_notify("editor.unfold"), { noremap = true, silent = true })
vim.keymap.set("n", "zO", vscode_notify("editor.unfoldRecursively"), { noremap = true, silent = true })
vim.keymap.set("n", "za", vscode_notify("editor.toggleFold"), { noremap = true, silent = true })

-- Active editor
vim.keymap.set("n", "<S-w>", vscode_notify("workbench.action.closeActiveEditor"))
vim.keymap.set("n", "<S-Tab>", vscode_notify("workbench.action.previousEditor"))
vim.keymap.set("n", "<Tab>", vscode_notify("workbench.action.nextEditor"))
vim.keymap.set("n", "<S-h>", vscode_notify("workbench.action.moveEditorLeftInGroup"))
vim.keymap.set("n", "<S-l>", vscode_notify("workbench.action.moveEditorRightInGroup"))

-- Toggles
vim.keymap.set('n', '<LEADER>e', vscode_notify("workbench.action.toggleSidebarVisibility"))

-- Hover
vim.keymap.set('n', 'K', vscode_notify("editor.action.showHover"))
vim.keymap.set('n', '<LEADER>k', vscode_notify("editor.action.showHover"))

-- VSCode definitions/references
vim.keymap.set('n', 'gd', vscode_notify("editor.action.revealDefinition"))
vim.keymap.set('n', 'gr', vscode_notify("editor.action.goToReferences"))

-- Editor actions
vim.keymap.set('n', '<LEADER>rn', vscode_notify("editor.action.rename"))
vim.keymap.set('n', '<LEADER>f', vscode_notify("editor.action.formatDocument"))

-- Already defined in vscode keybindings
-- -- Navigation
-- vim.keymap.set('n', '<C-j>', vscode_notify("workbench.action.navigateDown"))
-- vim.keymap.set('x', '<C-j>', vscode_notify("workbench.action.navigateDown"))
-- vim.keymap.set('n', '<C-k>', vscode_notify("workbench.action.navigateUp"))
-- vim.keymap.set('x', '<C-k>', vscode_notify("workbench.action.navigateUp"))
-- vim.keymap.set('n', '<C-h>', vscode_notify("workbench.action.navigateLeft"))
-- vim.keymap.set('x', '<C-h>', vscode_notify("workbench.action.navigateLeft"))
-- vim.keymap.set('n', '<C-l>', vscode_notify("workbench.action.navigateRight"))
-- vim.keymap.set('x', '<C-l>', vscode_notify("workbench.action.navigateRight"))
