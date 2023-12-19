local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

telescope.setup({
    defaults = {
        mappings = {
            i = {
                --["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            }
        }
    }
})

pcall(require('telescope').load_extension, 'fzf')

-- set keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "[F]ind [F]iles"})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = "[F]ind [R]ecent Files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "[F]ind Live [G]rep"})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {desc = "[F]ind [S]tring Under Cursor"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "[F]ind [B]uffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "[F]ind [H]elp"})
vim.keymap.set('n', '<leader>fm', builtin.man_pages, {desc = "[F]ind [M]an Pages"})
vim.keymap.set('n', '<leader>/',
    function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end,
    { desc = '[/] Fuzzily search in current buffer' }
)
