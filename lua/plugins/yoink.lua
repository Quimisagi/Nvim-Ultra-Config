-- Clipboard history
return {
  "svermeulen/vim-yoink",
  event = "VeryLazy",
  init = function()
    -- How many yanks to keep
    vim.g.yoinkMaxItems = 20

    -- Include deletes (d, x, c) in yank history
    vim.g.yoinkIncludeDeleteOperations = 1

    -- Sync yank history with numbered registers 1–9
    vim.g.yoinkSyncNumberedRegisters = 1

    -- Move cursor to end of pasted text (nice for multiline pastes)
    vim.g.yoinkMoveCursorToEndOfPaste = 1

    -- Wrap around when cycling yank history
    vim.g.yoinkSwapClampAtEnds = 0
  end,
}
