-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      ["local"] = "github.com/validationcloud",
      semanticTokens = true,
      buildFlags = { "-tags=integration,tools" },
    },
  },
}

lspconfig.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
}

lspconfig.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" }
}

lspconfig.graphql.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern(".graphqlconfig", ".graphqlrc", "package.json"),
  flags = {
    debounce_text_changes = 150,
  },
})

