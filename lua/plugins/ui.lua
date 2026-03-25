local theme = require("config.theme")

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = function(_, opts)
      opts.style = "night"
      opts.terminal_colors = true
      opts.transparent = false
      opts.styles = vim.tbl_deep_extend("force", opts.styles or {}, {
        comments = { italic = true },
        floats = "dark",
        sidebars = "dark",
      })
      opts.on_colors = theme.apply_tokyonight_colors
      opts.on_highlights = theme.apply_tokyonight_highlights
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diagnostics_dict)
          local icons = { error = " ", warning = " ", info = " ", hint = " " }
          local parts = {}
          for level, count in pairs(diagnostics_dict) do
            local icon = icons[level]
            if icon then
              table.insert(parts, icon .. count)
            end
          end
          return table.concat(parts, " ")
        end,
        hover = { enabled = true, reveal = { "close" } },
        indicator = { style = "underline" },
        modified_icon = "●",
        separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
      })

      opts.sections = opts.sections or {}
      opts.sections.lualine_x = opts.sections.lualine_x or {}

      table.insert(opts.sections.lualine_x, 1, {
        function()
          return "oc-2"
        end,
        color = { fg = theme.palette.blue, bg = theme.palette.bg_highlight, gui = "bold" },
        separator = { left = "", right = "" },
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.presets = vim.tbl_deep_extend("force", opts.presets or {}, {
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      })
      opts.cmdline = vim.tbl_deep_extend("force", opts.cmdline or {}, {
        view = "cmdline_popup",
      })
      opts.messages = vim.tbl_deep_extend("force", opts.messages or {}, {
        view_search = false,
      })
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      opts.background_colour = theme.palette.bg_dark
      opts.fps = 60
      opts.render = "wrapped-compact"
      opts.timeout = 2500
      opts.top_down = false
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.preset = "modern"
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>o", group = "open" },
        { "<leader>t", group = "terminal" },
        { "<leader>u", group = "ui" },
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "LazyFile",
    opts = function(_, opts)
      opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
        char = "▏",
      })
      opts.scope = vim.tbl_deep_extend("force", opts.scope or {}, {
        enabled = false,
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
      })

      opts.window = vim.tbl_deep_extend("force", opts.window or {}, {
        width = 34,
      })
    end,
  },
}
