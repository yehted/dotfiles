local has_words_before = function()
  if vim.api.nvim_get_option_value("buftype", {buf=0}) == "prompt" then return false end
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local cmp = require("cmp")

return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    -- config = function()
    --   require "configs.conform"
    -- end,
    opts = require "configs.conform",
  },

  -- {
  --   'kevinhwang91/nvim-ufo',
  --   lazy = false,
  --   dependencies = {
  --     'kevinhwang91/promise-async'
  --   },
  --   config = function ()
  --     vim.o.foldcolumn = "1" -- '0' is not bad
  --     vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
  --     vim.o.foldlevelstart = 99
  --     vim.o.foldenable = true
  --
  --     require("ufo").setup()
  --
  --     vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  --     vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  --   end
  -- },

  -- fix cursor jumping around
  -- https://www.reddit.com/r/neovim/comments/12z0orb/comment/jhq2ymd/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      region_check_events = "InsertEnter",
      delete_check_events = "TextChanged,InsertLeave",
    },
  },

  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  -- },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "async_path" },
      },
      -- mapping = {
      --   ["<Tab>"] = vim.schedule_wrap(function(fallback)
      --     if cmp.visible() and has_words_before() then
      --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      --     else
      --       fallback()
      --     end
      --   end),
      -- },
    },
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function ()
      require("copilot").setup({
          suggestion = {
              enabled = false, -- disable the suggestion popup
          },
          panel = {
              enabled = false, -- disable the panel
          },
      })
    end
  },

  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = "work",
          path = "~/Documents/Validation Cloud",
        },
      },
    },
  },

  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    config = function()
      require("smart-splits").setup{
        at_edge = 'stop',
      }
    end,
  },

  {
    "mfussenegger/nvim-dap",
    -- dependencies = { "leoluz/nvim-dap-go", "igorlfs/nvim-dap-view" },
    dependencies = { "leoluz/nvim-dap-go" },
    config = function()
      require("dap")
    end,
  },

  {
    "leoluz/nvim-dap-go",
    config = function()
      require "configs.dap-go"
    end,
  },

  {
    "igorlfs/nvim-dap-view",
    dependencies = { "mfussenegger/nvim-dap" },
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {
      windows = {
        terminal = {
            -- Use the actual names for the adapters you want to hide
            hide = { "delve" }, -- `delve` is known to not use the terminal.
        },
      },
    },
  },

  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  --   config = function()
  --     require("dapui").setup()
  --   end,
  -- },

  {
    "f-person/git-blame.nvim",
    lazy = false,
    config = function()
      require('gitblame').setup{
        date_format = '%r',
        enabled = false,
      }
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
  		ensure_installed = {
        -- lua stuff
  			"lua_ls", "stylua",

        -- web dev stuff
  			"html", "cssls" ,
        -- "prettier",
        -- "typescript-language-server",
        "ts_ls",
        "denols",

        "clangd",
        -- "clang-format",

        -- shell stuff
        -- "shfmt",

        -- my stuff
        "graphql",
        "terraformls",
        "tflint",
        "buf_ls",
        "gopls",
        "postgres_lsp",
        "helm_ls",
        -- "rust-analyzer",
  		},
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },

  {
  	"mason-org/mason.nvim",
  	opts = {},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc", "html", "css",

        "javascript", "typescript", "tsx",
        "c",
        "markdown", "markdown_inline",
        "dockerfile",
        "graphql",
        "terraform",
        "yaml", "proto",
        "go",
        "rust",
        "yaml",
        "helm",
  		},
  	},
  },

  -- {
  --   "ahmedkhalf/project.nvim",
  --   lazy = false,
  --   config = function()
  --     require("project_nvim").setup()
  --   end
  -- },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      -- sync_root_with_cwd = true,
      -- respect_buf_cwd = true,
      -- update_focused_file = {
      --   enable = true,
      --   update_root = true
      -- },
    },
  },

  { 'rust-lang/rust.vim' },

  {
      'mrcjkb/rustaceanvim',
      version = '^6',
      ft = { 'rust' },
  },

  {
    "qvalentin/helm-ls.nvim",
    ft = "helm",
    opts = {
        -- leave empty or see below
    },
  },

  {
     "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function opts(desc)
          return { buffer = bufnr, desc = desc }
        end

        local map = vim.keymap.set

        map("n", "<leader>rh", gs.reset_hunk, opts "Reset Hunk")
        map("n", "<leader>gb", gs.blame_line, opts "Blame Line")
        map("n", "<leader>ph", gs.preview_hunk, opts "Preview Hunk")
      end,
    }
  },
}
