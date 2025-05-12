require "nvchad.options"

-- add yours here!
vim.g.neovide_input_macos_option_key_is_meta = 'both'


-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
  end,
})

-- diff
vim.o.diffopt = 'internal,filler,closeoff'

vim.g.smart_splits_multiplexer_integration = true

