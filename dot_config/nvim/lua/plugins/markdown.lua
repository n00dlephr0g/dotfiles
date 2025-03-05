return {
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        lazy = true,
        keys = { { "gm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
        config = function()
            vim.cmd([[do FileType]])
            vim.cmd([[
        function OpenMarkdownPreview (url)
            let cmd = "zen-browser --new-window " . shellescape(a:url) . " &"
            silent call system(cmd)
        endfunction
        ]])
            vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
            vim.g.mkdp_open_to_the_world = 1
            vim.g.mkdp_open_ip = "0.0.0.0"
            vim.g.mkdp_port = "9003"
            vim.g.mkdp_combine_preview = 1
        end,
    },
}
