return {
	"lervag/vimtex",
	lazy = false, -- Load immediately (not lazy-loaded)
	-- tag = "v2.15", -- Uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration
		vim.g.vimtex_view_method = "zathura"
	end,
}
