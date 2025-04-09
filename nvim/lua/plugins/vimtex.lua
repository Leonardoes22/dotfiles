return {
  {
    "lervag/vimtex",
    vscode = true,
    lazy = false,
    -- init = function()
    --   vim.g.vimtex_mappings_prefix = "<leader>l"
    -- end,
    config = function()
      vim.g.vimtex_fold_enabled = true
      vim.g.vimtex_fold_types = {
        markers = {
          enabled = 0,
        },
      }
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = "./.output/",
        out_dir = "./.output/",
      }
      vim.g.vimtex_quickfix_open_on_warning = 0
      -- vim.keymap.set({ "n" }, "dsm", "<plug>(vimtex-env-delete-math)")
      -- vim.keymap.set({ "n" }, "csm", "<plug>(vimtex-env-change-math)")
      -- vim.keymap.set({ "o", "x" }, "am", "<plug>(vimtex-a$)")
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
      { "am", "<plug>(vimtex-a$)", mode = { "x", "o" }, ft = "tex" },
      { "im", "<plug>(vimtex-i$)", mode = { "x", "o" }, ft = "tex" },
      { "ai", "<plug>(vimtex-am)", mode = { "x", "o" }, ft = "tex" },
      { "ii", "<plug>(vimtex-im)", mode = { "x", "o" }, ft = "tex" },
      { "dsm", "<plug>(vimtex-env-delete-math)", mode = { "n" }, ft = "tex" },
      { "csm", "<plug>(vimtex-env-change-math)", mode = { "n" }, ft = "tex" },
      { "tsm", "<plug>(vimtex-env-toggle-math)", mode = { "n" }, ft = "tex" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.icons = {
        rules = {
          { pattern = "+vimtex", icon = " ", color = "yellow" },
        },
      }
    end,
  },
  {
    "echasnovski/mini.pairs",
    opts = {
      mappings = {
        ["$"] = { action = "open", pair = "$$", neigh_pattern = "[^%w].", register = { cr = false } },
      },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      custom_surroundings = {
        e = {
          input = {
            find = [[\begin{(%w*)}.-\end{%1}]],
            extract = [[^(\begin{.-}).-(\end{.-})$]],
          },
          output = function()
            local latex_name = MiniSurround.user_input("Latex environment name")
            if latex_name == nil or latex_name == "" then
              return nil
            end
            return {
              left = string.format("\\begin{%s}", latex_name),
              right = string.format("\\end{%s}", latex_name),
            }
          end,
        },
        c = {
          input = {
            find = [[\%w+%b{}]],
            extract = "^(.-{).*(})$",
          },
          output = function()
            local cmd_name = MiniSurround.user_input("Latex command name")
            if cmd_name == nil or cmd_name == "" then
              return nil
            end
            return {
              left = string.format("\\%s{", cmd_name),
              right = "}",
            }
          end,
        },
      },
    },
  },
  -- Correctly setup lspconfig for LaTeX 🚀
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        texlab = {
          keys = {
            { "<leader>K", "<plug>(vimtex-doc-package)", desc = "vimtex docs", silent = true },
            { "]]", "<plug>(vimtex-]])", desc = "Next section" },
            { "[[", "<plug>(vimtex-[[)", desc = "Previous section" },
          },
          settings = {
            texlab = {
              latexFormatter = "latexindent",
              chktex = {
                onEdit = true,
                onOpenAndSave = true,
                additionalArgs = { "-n3" },
              },
              latexindent = {
                modifyLineBreaks = true,
                ["local"] = "./.vscode/latexindent.yaml",
              },
            },
          },
        },
      },
    },
  },
  { "hrsh7th/cmp-buffer", enabled = false },
  -- {
  --   "saghen/blink.cmp",
  --   opts = {
  --     sources = {
  --       providers = {
  --         buffer = {
  --           enabled = false,
  --         },
  --       },
  --     },
  --   },
  -- },
}
