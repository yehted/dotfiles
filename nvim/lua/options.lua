require "nvchad.options"

-- add yours here!
vim.g.neovide_input_macos_option_key_is_meta = 'both'


-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- folding 
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({fold = " "})
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/foldingRange") then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldmethod = "expr"
			vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
		end
	end,
})
vim.api.nvim_create_autocmd("LspDetach", { command = "setl foldexpr<" })

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

-- fix cursor jumping around
-- https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1429989436
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end
})

-- diff
vim.o.diffopt = 'internal,filler,closeoff'

vim.g.smart_splits_multiplexer_integration = true

-- Add concealing when we open markdown files for obsidian.nvim ui
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function (opts)
    if vim.bo[opts.buf].filetype == 'markdown' then
      vim.opt.conceallevel = 2
    end
  end,
})
