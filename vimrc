set nocompatible

execute pathogen#infect()

" try and figure type of file
filetype indent plugin on

" Turn on syntax highlights
syntax on

" Allow reusing same window
set hidden

" Turn on line numbers
set number

" Turn on better command-line completion
set wildmenu

" Show partial commands in last line of screen
set showcmd

" Show partial searches (use <C-L> to temporarily tur off highlighting)
set hlsearch

" Use case insensitive searching except with capital letters
set ignorecase
set smartcase

" Stop movments from always going to first character in line
set nostartofline

" Display cursor position on last line of screen
set ruler

" Always show status line
set laststatus=2

" Show confirm for unsaved changes
set confirm

" Show visual bell instead of audio
set visualbell
set t_vb=

" Show whitespace
set list

" Some tab customization
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" Have Y act like D and C, yank to EOL 
map Y y$

" Map <C-L> to also turn off search highlighting
nnoremap <C-L> :nohl<CR><C-L>

" Highlight characters over 80
set colorcolumn=81

colorscheme vividchalk
