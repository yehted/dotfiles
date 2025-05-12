return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
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
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

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
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
        -- lua stuff
  			"lua-language-server", "stylua",

        -- web dev stuff
  			"html-lsp", "css-lsp" , "prettier",
        "typescript-language-server", "deno",

        "clangd", "clang-format",

        -- shell stuff
        "shfmt",

        -- my stuff
        "graphql-language-service-cli",
        "terraform-ls",
        "tflint",
        "buf",
        "buf-language-server",
        "gopls",
        "rust-analyzer",
  		},
  	},
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
  		},
  	},
  },

  { 'rust-lang/rust.vim' },

  {
      'mrcjkb/rustaceanvim',
      version = '^5',
      ft = { 'rust' },
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
