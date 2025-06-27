-- lua/commands.lua (or wherever you define your Lua commands)

function InsertAlignedMathBlock()
    local lines = {
        "$$",
        "\\begin{aligned}",
        "", -- This is the line where the cursor will be placed
        "\\end{aligned}",
        "$$",
    }
    local current_win = vim.api.nvim_get_current_win()
    local current_buf = vim.api.nvim_win_get_buf(current_win) -- Get buffer from window

    -- Get the cursor position: {row, col} (row is 1-based, col is 0-based)
    -- We only need the row number for insertion point calculation
    local cursor_row_1based, _ = vim.api.nvim_win_get_cursor(current_win)
    -- ^^^ ENSURE you have ", _" here to unpack the table and get just the row number ^^^
    -- This was the likely cause of the "attempt to perform arithmetic on a table value" error.

    -- Calculate the 0-indexed line number for API calls
    local cursor_row_0based = cursor_row_1based - 1

    -- --- Insertion ---
    -- nvim_buf_set_lines(buffer, start_idx, end_idx, strict_indexing, lines)
    -- This function inserts 'lines' *before* line `start_idx`.
    -- To insert *after* the current line (which is at 0-indexed `cursor_row_0based`),
    -- we need to insert at the next line index, which is `cursor_row_0based + 1`.
    local insertion_index_0based = cursor_row_0based + 1

    vim.api.nvim_buf_set_lines(current_buf, insertion_index_0based, insertion_index_0based, false, lines)

    -- --- Cursor Positioning ---
    -- Calculate the target line number for the cursor (1-based for nvim_win_set_cursor)
    -- The inserted lines start at 0-indexed `insertion_index_0based`.
    -- The blank line (cursor target) is the 3rd line in the 'lines' table (index 2 in Lua's 0-based list).
    -- So, its 0-indexed buffer line number is insertion_index_0based + 2.
    local target_row_0based = insertion_index_0based + 2

    -- The target column is the very beginning of the line (column 0)
    local target_col_0based = 0

    -- Move the cursor (nvim_win_set_cursor expects 1-based row, 0-based col)
    vim.api.nvim_win_set_cursor(current_win, { target_row_0based + 1, target_col_0based })

    -- Optional: Automatically enter insert mode after placing the cursor
    vim.cmd("startinsert")
end

-- Create a user command that calls the Lua function
vim.api.nvim_create_user_command(
    "MathBlockAligned",
    InsertAlignedMathBlock,
    {} -- No arguments allowed for this command
)
