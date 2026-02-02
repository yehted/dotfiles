-- EXAMPLE 
-- local on_attach = require("nvchad.configs.lspconfig").on_attach
-- local on_init = require("nvchad.configs.lspconfig").on_init
-- local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls", "gh_actions_ls", "postgres_lsp", "ts_ls", "helm_ls", "gopls", "yamlls" }

-- For nvim-ufo
-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
-- for _, ls in ipairs(servers) do
--     require('lspconfig')[ls].setup({
--         capabilities = capabilities
--         -- you can add other fields for setting up lsp server in this table
--     })
-- end
-- require('ufo').setup()

-- lsps with default config
vim.lsp.enable(servers)

