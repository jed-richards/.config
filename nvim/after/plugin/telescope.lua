--local telescope = require('telescope')
--telescope.setup({
--    defaults = {
--        layout_strategy = "horizontal",
--        layout_config = {
--            width = 0.95,
--            height = 0.85,
--            prompt_position = "top",
--        },
--    },

--    color_devicons = true,

--    pickers = {
--        find_files = {
--            theme = "dropdown",
--            --theme = "cursor",
--            --theme = "ivy",
--        },
--    },
--})

pcall(require('telescope').load_extension, 'fzf')

-- set keymaps
local builtin = require('telescope.builtin')
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
