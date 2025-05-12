require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- debugging
map("n", "<leader>dt", function()
  -- require("dap-view").toggle()
  require("dapui").toggle()
end, {desc = "toggle dap ui"})

map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, {desc = "toggle breakpoint"})

map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "debugger continue"})

map("n", "<leader>dr", function()
  require("dapui").open({reset = true})
end, { desc ="reset dap ui"})

-- cycle through buffers
map("n", "<C-]>", function()
  require("nvchad.tabufline").next()
end, {desc ="Goto next buffer"})

map("n", "<C-[>", function()
  require("nvchad.tabufline").prev()
end, {desc = "Goto prev buffer"})

-- jump back and forward
-- map("n", "<C-]>", "<C-i>", {desc = "jump forward"})
-- map("n", "<C-[>", "<C-o>", {desc = "jump back"})

-- telescope
map("n", "<leader>fu", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "telescope document symbols" })

-- disable mappings
local nomap = vim.keymap.del

nomap("n", "<tab>")
nomap("n", "<S-tab>")

-- smart-splits
-- navigate between multiplexer panes

-- moving between splits

map("n", "<C-h>", function()
  require("smart-splits").move_cursor_left()
end
)

map("n", "<C-j>", function()
  require("smart-splits").move_cursor_down()
end
)

map("n", "<C-k>", function()
  require("smart-splits").move_cursor_up()
end
)

map("n", "<C-l>", function()
  require("smart-splits").move_cursor_right()
end
)
