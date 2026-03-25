local function extend_unique(list, items)
  if type(list) ~= "table" then
    return
  end

  local seen = {}
  for _, item in ipairs(list) do
    seen[item] = true
  end

  for _, item in ipairs(items) do
    if not seen[item] then
      table.insert(list, item)
    end
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        layout_config = {
          height = 0.88,
          prompt_position = "top",
          width = 0.92,
        },
        layout_strategy = "horizontal",
        prompt_prefix = "   ",
        selection_caret = "❯ ",
        sorting_strategy = "ascending",
        winblend = 0,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      extend_unique(opts.ensure_installed, {
        "bash",
        "diff",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "printf",
        "query",
        "regex",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      })
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      extend_unique(opts.ensure_installed, {
        "lua-language-server",
        "shellcheck",
        "shfmt",
        "stylua",
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.lua = { "stylua" }
      opts.formatters_by_ft.sh = { "shfmt" }
      opts.formatters_by_ft.zsh = { "shfmt" }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.lua_ls = vim.tbl_deep_extend("force", opts.servers.lua_ls or {}, {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              globals = { "vim" },
            },
            hint = {
              enable = true,
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
      opts.signs = vim.tbl_deep_extend("force", opts.signs or {}, {
        add = { text = "▎" },
        change = { text = "▎" },
        changedelete = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        untracked = { text = "▎" },
      })
    end,
  },
}
