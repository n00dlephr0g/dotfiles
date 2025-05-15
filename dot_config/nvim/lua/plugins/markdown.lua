return {
    {
        "tpope/vim-markdown",
        ft = "markdown", -- Keep the filetype detection
        lazy = true, -- Keep it lazy
        -- *** Add an explicit event trigger ***
        -- Use BufReadPre to ensure it loads early when a markdown buffer is read
        event = { "BufReadPre *.md" },
        -- If you have polyglot too and want markdown to come from vim-markdown,
        -- ensure vim-markdown is processed *after* polyglot if load order conflicts
        -- dependencies = { 'sheerun/vim-polyglot' }, -- Example: Load after polyglot
    },
}
