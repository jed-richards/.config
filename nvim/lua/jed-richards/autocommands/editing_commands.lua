local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local CodeMonkeyGroup = augroup("CodeMonkey", {})
local yank_group = augroup("HighlightYank", {})

-- Highlight yanked stuff
autocmd('TextYankPost', {
    group = yank_group,
    pattern = "*",
    callback = function ()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end
})

-- Remove trailing whitespace on write
autocmd({"BufWritePre"}, {
    group = CodeMonkeyGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
