return {
    {
        'catppuccin/nvim',
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                transparent_background = true,
                custom_highlights = function(colors)
                    return {
                        GitSignsCurrentLineBlame = { fg = colors.overlay1, style = { 'italic' } },
                    }
                end,
            }
            vim.cmd 'colorscheme catppuccin-mocha'
        end,
    },
}
