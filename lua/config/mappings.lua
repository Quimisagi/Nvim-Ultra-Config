-- Neo-tree
vim.keymap.set("n", "<leader>e", function()
  vim.cmd("Neotree toggle filesystem left")
end, { desc = "Neo-tree Explorer" })

vim.keymap.set("n", "<leader>g", function()
  vim.cmd("Neotree toggle git_status left")
end, { desc = "Neo-tree Git Status" })

vim.keymap.set("n", "<leader>b", function()
  vim.cmd("Neotree toggle buffers left")
end, { desc = "Neo-tree Buffers" })


-- Term
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", {
  desc = "Toggle terminal",
})

vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", {
  desc = "Toggle floating terminal",
})

vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", {
  desc = "Toggle horizontal terminal",
})

vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", {
  desc = "Toggle vertical terminal",
})

--Aura
vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<CR>", { desc = "Toggle Aerial" })

--Buffer navigation

vim.keymap.set("n", "<M-H>", "<C-w>h", { desc = "Focus left split" })
vim.keymap.set("n", "<M-J>", "<C-w>j", { desc = "Focus down split" })
vim.keymap.set("n", "<M-K>", "<C-w>k", { desc = "Focus up split" })
vim.keymap.set("n", "<M-L>", "<C-w>l", { desc = "Focus right split" })


--Telescope

vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "Buffers" })

--Searchbox

vim.keymap.set("n", "<leader>ss", "<cmd>SearchBoxIncSearch<CR>", {
  desc = "Searchbox: incremental search",
})

vim.keymap.set("n", "<leader>sm", "<cmd>SearchBoxMatchAll<CR>", {
  desc = "Searchbox: match all",
})

vim.keymap.set("n", "<leader>sr", "<cmd>SearchBoxReplace<CR>", {
  desc = "Searchbox: search & replace",
})


--Move
vim.keymap.set("n", "<A-j>", "<cmd>MoveLine(1)<CR>", {
  desc = "Move line down",
})

vim.keymap.set("n", "<A-k>", "<cmd>MoveLine(-1)<CR>", {
  desc = "Move line up",
})

vim.keymap.set("n", "<A-h>", "<cmd>MoveHChar(-1)<CR>", {
  desc = "Move character left",
})

vim.keymap.set("n", "<A-l>", "<cmd>MoveHChar(1)<CR>", {
  desc = "Move character right",
})

vim.keymap.set("v", "<A-j>", "<cmd>MoveBlock(1)<CR>", {
  desc = "Move selection down",
})

vim.keymap.set("v", "<A-k>", "<cmd>MoveBlock(-1)<CR>", {
  desc = "Move selection up",
})

vim.keymap.set("v", "<A-h>", "<cmd>MoveHBlock(-1)<CR>", {
  desc = "Move selection left",
})

vim.keymap.set("v", "<A-l>", "<cmd>MoveHBlock(1)<CR>", {
  desc = "Move selection right",
})

--Barbar

-- Buffer navigation
vim.keymap.set("n", "<A-,>", "<cmd>BufferPrevious<CR>", {
  desc = "Buffer: previous",
})

vim.keymap.set("n", "<A-.>", "<cmd>BufferNext<CR>", {
  desc = "Buffer: next",
})

vim.keymap.set("n", "<A-<>", "<cmd>BufferMovePrevious<CR>", {
  desc = "Buffer: move left",
})

vim.keymap.set("n", "<A->>", "<cmd>BufferMoveNext<CR>", {
  desc = "Buffer: move right",
})

vim.keymap.set("n", "<A-1>", "<cmd>BufferGoto 1<CR>", {
  desc = "Buffer: go to 1",
})

vim.keymap.set("n", "<A-2>", "<cmd>BufferGoto 2<CR>", {
  desc = "Buffer: go to 2",
})

vim.keymap.set("n", "<A-3>", "<cmd>BufferGoto 3<CR>", {
  desc = "Buffer: go to 3",
})

vim.keymap.set("n", "<A-4>", "<cmd>BufferGoto 4<CR>", {
  desc = "Buffer: go to 4",
})

vim.keymap.set("n", "<A-5>", "<cmd>BufferGoto 5<CR>", {
  desc = "Buffer: go to 5",
})

vim.keymap.set("n", "<A-c>", "<cmd>BufferClose<CR>", {
  desc = "Buffer: close",
})

vim.keymap.set("n", "<leader>bc", "<cmd>BufferCloseAllButCurrent<CR>", {
  desc = "Buffer: close others",
})

vim.keymap.set("n", "<leader>bp", "<cmd>BufferPin<CR>", {
  desc = "Buffer: pin/unpin",
})

vim.keymap.set("n", "<leader>bb", "<cmd>BufferPick<CR>", {
  desc = "Buffer: pick",
})

--Yoink
vim.keymap.set("n", "p", "<plug>(YoinkPaste_p)", {
  desc = "Yoink: paste after cursor",
})

vim.keymap.set("n", "P", "<plug>(YoinkPaste_P)", {
  desc = "Yoink: paste before cursor",
})

vim.keymap.set("n", "<A-o>", "<plug>(YoinkPostPasteSwapBack)", {
  desc = "Yoink: replace paste with previous yank",
})

vim.keymap.set("n", "<A-p>", "<plug>(YoinkPostPasteSwapForward)", {
  desc = "Yoink: replace paste with next yank",
})

--Cut
vim.keymap.set("n", "m", "d", {
  desc = "Cut",
})

vim.keymap.set("x", "m", "d", {
  desc = "Cut (visual)",
})

vim.keymap.set("n", "mm", "dd", {
  desc = "Cut line",
})

vim.keymap.set("n", "M", "D", {
  desc = "Cut to end of line",
})

--LSP
--Conform
vim.keymap.set("n", "<leader>f", function()
  require("conform").format({
    lsp_fallback = true,
    async = true,
    timeout_ms = 500,
  })
end, { desc = "Format file (Conform)" })

vim.keymap.set("n", "<C-l>", vim.lsp.buf.definition, {
  desc = "Go to definition",
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
  desc = "Code actions",
})
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)

--Lspsaga

-- Peek Definition in floating window
vim.keymap.set("n", "<leader>l", "<cmd>Lspsaga peek_definition<CR>", {
  desc = "Peek Definition",
})

-- Hover documentation
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", {
  desc = "Hover Documentation",
})

-- Rename (project-wide)
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {
  desc = "Rename Symbol",
})

-- Show references
vim.keymap.set("n", "<leader>ci", "<cmd>Lspsaga finder<CR>", {
  desc = "LSP Finder (implementations & references)",
})

