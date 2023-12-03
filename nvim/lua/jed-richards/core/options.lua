-- Highlight Search
vim.opt.hlsearch = true       -- highlight all matches on previous search pattern
vim.opt.ignorecase = true     -- ignore case in search patterns
vim.opt.smartcase = true      -- smart case

-- Tab and Indent
vim.opt.tabstop = 4           -- tabs are 4 spaces
vim.opt.softtabstop = 4       -- tabs are 4 spaces
vim.opt.shiftwidth = 4        -- number of spaces to use on indent
vim.opt.expandtab = true      -- turns tabs to spaces
vim.opt.smartindent = true    -- This sets smartindent

-- Backup and Swap Files
vim.opt.backup = false        -- creates a backup file
vim.opt.swapfile = false      -- creates a swapfile
vim.opt.undofile = true       -- enable persistent undo
vim.opt.writebackup = false   -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- Looks and Scrolling
vim.opt.cursorline = true         -- highlight the current line
vim.opt.number = true             -- set numbered lines
vim.opt.relativenumber = true     -- set relative numbered lines
vim.opt.colorcolumn = "80"        -- column at 80 to keep files "clean"
vim.opt.scrolloff = 8             -- allows 8 lines top and bottom while scrolling
vim.opt.signcolumn = "yes"        -- allows column to be used to the left of numbers
vim.opt.numberwidth = 4           -- set number column width to 4
vim.opt.guicursor = ""            -- This makes the cursor fat (Me likey...)
vim.opt.wrap = false              -- display lines as one long line
vim.opt.pumheight = 10            -- pop up menu height
--vim.opt.cmdheight = 2             -- more space in the neovim command line for displaying messages
vim.opt.showmode = true           -- to see things like -- INSERT --
vim.cmd [[set whichwrap+=h,l]]    -- allows h and l to move to next line if at last character
vim.cmd [[set iskeyword+=-]]   	  -- allows word-with-dashes to be seen as one word
--vim.opt.iskeyword:append("-")     -- same as above

-- Splits and Tabs
vim.opt.splitbelow = true    -- force all horizontal splits to go below current window
vim.opt.splitright = true    -- force all vertical splits to go to the right of current window
vim.opt.showtabline = 2      -- always show tabs

-- Mouse and Clipboard
-- allows neovim access to system clipboard through WSL
vim.cmd [[
    set clipboard+=unnamedplus
    let g:clipboard = {
        \   'name': 'WslClipboard',
        \   'copy': {
        \      '+': 'clip.exe',
        \      '*': 'clip.exe',
        \    },
        \   'paste': {
        \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \   },
        \   'cache_enabled': 0,
        \ }
]]
--vim.opt.mouse = "a"          -- allow the mouse to be used in neovim

-- Random
vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
--vim.opt.guifont = "monospace:h17"             -- the font used in graphical neovim applications

-- Makes command search look better
--vim.opt.pumblend = 17  -- transparent
vim.opt.wildmode = "longest:full"
vim.opt.wildoptions = "pum"
