return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = "personal",
                path = "~/personal",
                overrides = {
                    notes_subdir = "misc",
                },
            },
            {
                name = "repos",
                path = "~/repos",
            },
            {
                name = "school",
                path = "~/school",
                overrides = {
                    notes_subdir = "cards",
                },
            },
        },
        new_notes_location = "notes_subdir",
        attachments = {
            img_folder = "images",
        },

        -- Optional, customize how note IDs are generated given an optional title.
        ---@param title string|?
        ---@return string
        note_id_func = function(title)
            local base_id = ""
            if title ~= nil then
                -- Sanitize the title to create a valid filename part.
                base_id = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- If no title is given, fall back to a generic name like 'new-note'
                base_id = "new-note"
            end

            -- Generate a human-readable timestamp with Year-Month-Day-Hour
            local human_timestamp = os.date("%Y-%m-%d-%H")

            -- Combine the sanitized title and the timestamp.
            return base_id .. "-" .. human_timestamp
        end,
    },
}
