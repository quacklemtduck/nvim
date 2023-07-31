vim.g.barbar_auto_setup = false -- disable auto-setup
require'barbar'.setup {
    icons = {
        gitsigns = {
            added = {enabled = true, icon = '+'},
            changed = {enabled = true, icon = '~'},
            deleted = {enabled = true, icon = '-'},
        },
    },
}
