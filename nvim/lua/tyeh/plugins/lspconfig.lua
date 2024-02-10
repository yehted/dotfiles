return {
  "neovim/nvim-lspconfig",
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end

    lspconfig.gopls.setup({
      on_attach = on_attach,
      settings = {
        gopls = {
          semanticTokens = true,
        }
      }
    })

  end,
}
