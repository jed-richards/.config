"Enable syntax highlighting
syntax on

"Remove Bells/Flashes
autocmd VimEnter * set vb t_vb=

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set smarttab
set cindent

set number
set incsearch
set hlsearch
set ignorecase
set smartcase

set scrolloff=8

set cursorline
set cursorlineopt=line
hi CursorLine cterm=NONE ctermbg=235

set colorcolumn=80
hi ColorColumn cterm=NONE ctermbg=235

set guicursor=""
"set termguicolors

noremap <C-f> :Ex<CR>
