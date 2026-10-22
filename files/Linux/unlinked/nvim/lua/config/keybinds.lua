local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- buffers (the "tabs" in bufferline)
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete buffer" })
map("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete other buffers" })

-- move between windows
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- splits, QWERTZ: - and # are both unshifted
map("n", "<leader>-", "<cmd>split<cr>", { desc = "Split below" })
map("n", "<leader>#", "<cmd>vsplit<cr>", { desc = "Split right" })
map("n", "<leader>wd", "<C-w>c", { desc = "Close window" })
map("n", "<leader>w=", "<C-w>=", { desc = "Equalize windows" })

-- resize with alt + hjkl
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Narrower" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Wider" })
map("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Shorter" })
map("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Taller" })

-- QWERTZ: ö/ä act as [ and ], so öd / äd jump between diagnostics etc.
map({ "n", "x", "o" }, "ö", "[", { remap = true })
map({ "n", "x", "o" }, "ä", "]", { remap = true })
