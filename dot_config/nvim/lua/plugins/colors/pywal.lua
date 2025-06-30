-- File: pywaltheme.lua
-- This file is a custom theme for onedarkpro.nvim, dynamically loading Pywal colors from colors.json.
-- It returns a table with 'meta', 'palette', and 'generated' fields, as expected by onedarkpro.nvim.

-- --- IMPORTANT: Ensure 'wal -R' has been run at least once to generate colors.json ---

-- Path to Pywal's generated colors.json
local pywal_json_file = vim.fn.expand("~/.cache/wal/colors.json")

-- Placeholder for Pywal data and the final palette
local pywal_data = {}
local pywal_derived_palette = {} -- This will be our main palette for onedarkpro.nvim
local fallback = {
    special = { background = "#282c34", foreground = "#abb2bf" },
    colors = {
        color0 = "#282c34",
        color1 = "#e06c75",
        color2 = "#98c379",
        color3 = "#e5c07b",
        color4 = "#61afef",
        color5 = "#c678dd",
        color6 = "#56b6c2",
        color7 = "#abb2bf",
        color8 = "#5c6370",
        color9 = "#e06c75",
        color10 = "#98c379",
        color11 = "#e5c07b",
        color12 = "#61afef",
        color13 = "#c678dd",
        color14 = "#56b6c2",
        color15 = "#abb2bf",
    },
}

-- Attempt to load and parse colors.json
if vim.fn.filereadable(pywal_json_file) then
    local content_lines = vim.fn.readfile(pywal_json_file)
    local json_string = table.concat(content_lines, "\n")

    local ok, parsed_data = pcall(vim.json.decode, json_string)
    if ok and type(parsed_data) == "table" and parsed_data.colors and parsed_data.special then
        pywal_data = parsed_data
        --vim.notify("Pywal colors.json loaded successfully.", vim.log.levels.INFO) -- Don't notify from theme file
    else
        -- Log the actual parsing error for debugging (will appear in :messages)
        vim.api.nvim_err_writeln("OneDarkPro Pywal Theme Error: Failed to parse colors.json: " .. tostring(parsed_data))
        -- Fallback to a default dark palette if JSON parsing fails
        pywal_data = fallback
    end
else
    vim.api.nvim_err_writeln(
        "OneDarkPro Pywal Theme Warning: colors.json not found at "
            .. pywal_json_file
            .. ". Using fallback default theme."
    )
    -- Fallback to a default dark palette if file not found
    pywal_data = fallback
end

-- Determine background meta based on Pywal's background color
local meta_background = "dark"
if pywal_data.special.background then
    -- Simple check: if average RGB is above a threshold, consider it light
    local r = tonumber(pywal_data.special.background:sub(2, 3), 16)
    local g = tonumber(pywal_data.special.background:sub(4, 5), 16)
    local b = tonumber(pywal_data.special.background:sub(6, 7), 16)
    if (r + g + b) / 3 > 128 then -- Average component value
        meta_background = "light"
    end
end

-- Define the 'meta' table as expected by onedarkpro.nvim
local meta = {
    name = "pywal", -- This is the name onedarkpro.nvim will use internally
    background = meta_background,
}

-- Map Pywal's raw colors to OneDarkPro's expected base palette names
-- This is equivalent to onedarkpro's 'default_colors' but dynamically from Pywal.
pywal_derived_palette = {
    bg = pywal_data.special.background,
    fg = pywal_data.special.foreground,
    red = pywal_data.colors.color1,
    orange = pywal_data.colors.color3, -- Pywal's color3 is often yellow/orange
    yellow = pywal_data.colors.color3,
    green = pywal_data.colors.color2,
    cyan = pywal_data.colors.color6,
    blue = pywal_data.colors.color4,
    purple = pywal_data.colors.color5, -- Pywal's color5 is often magenta/purple
    white = pywal_data.colors.color7,
    black = pywal_data.colors.color0,
    gray = pywal_data.colors.color8,

    highlight = pywal_data.colors.color3, -- Often yellow/orange for highlights
    comment = pywal_data.colors.color8, -- Often gray for comments
    none = "NONE",
}

--- The 'generate' function, as expected by onedarkpro.nvim.
--- It receives the 'palette' (which is our pywal_derived_palette) and uses onedarkpro.helpers
--- to derive additional colors.
--- @param colors table The base color palette (our pywal_derived_palette)
--- @return table The generated derived colors
local function generate(colors)
    local color = require("onedarkpro.helpers")

    return {
        -- Derived colors, ensuring no hardcoded fallbacks from onedarkpro's internal logic.
        -- All these values are now explicitly calculated from our Pywal-derived 'colors' table.
        cursorline = color.darken(colors.bg, 2),
        color_column = color.darken(colors.bg, 2),
        fold = color.darken(colors.bg, 3),
        line_number = color.lighten(colors.fg, 10),
        indentline = color.darken(colors.bg, 5),
        selection = color.darken(colors.bg, 8),
        float_bg = color.darken(colors.bg, 3), -- Matches original derivation
        inlay_hint = color.darken(colors.gray, 7), -- Matches original derivation

        -- Git colors
        git_add = color.lighten(colors.green, 5),
        git_change = color.lighten(colors.yellow, 5),
        git_delete = color.darken(colors.red, 5),

        git_hunk_add = color.darken(colors.green, 15),
        git_hunk_delete = color.darken(colors.red, 15),
        git_hunk_add_inline = color.darken(colors.green, 20),
        git_hunk_change_inline = color.darken(colors.yellow, 20),
        git_hunk_delete_inline = color.darken(colors.red, 20),

        -- Git diff
        diff_add = color.darken(colors.green, 25),
        diff_delete = color.darken(colors.red, 25),
        diff_text = color.darken(colors.cyan, 25),

        -- Lualine colors
        bg_statusline = color.darken(colors.bg, 2.5), -- Matches original derivation
        fg_gutter = color.lighten(colors.bg, 9.6), -- Matches original derivation
        fg_gutter_inactive = colors.fg, -- Matches original logic

        -- Virtual text
        virtual_text_error = color.lighten(colors.red, 9.3),
        virtual_text_warning = color.lighten(colors.yellow, 9),
        virtual_text_information = color.lighten(colors.blue, 10.2),
        virtual_text_hint = color.lighten(colors.cyan, 10.8),
    }
end
-- --- THIS IS THE CRUCIAL RETURN TABLE ---
-- This is what onedarkpro.nvim expects your custom theme file to return.
return {
    meta = meta,
    palette = pywal_derived_palette, -- This is your Pywal-derived base palette
    generated = function()
        -- The 'generated' function calls our local 'generate' function
        -- passing it the Pywal-derived palette.
        return generate(pywal_derived_palette)
    end,
}
