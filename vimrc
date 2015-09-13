" Use Vim settings over Vi settings, this must be loaded first to avoid side
" effects
set nocompatible

" Load plugins through pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" ==================== General Settings ====================

set number                             " Line numbers on left
set backspace=indent,eol,start         " Let backspace remove indents
set history=1000                       " Hold longer :cmdline history
set showcmd                            " Show incomplete cmds at bottom
set noshowmode                           " Show current mode at bottom
set gcr=a:blinkon0                     " Disable cursor blink
set visualbell                         " No sounds
set autoread                           " Reload files changed outside of vim
set nostartofline                      " Don't move cursor to start of line
set ruler                              " Show ruler at bottom
set laststatus=2                       " Always show status line
set confirm                            " Show confirm for unsaved changes

" Allow buffers to exist in background without being in a window
set hidden

" Turn on syntax highlight
syntax on
syntax enable
set background=dark

" ==================== Indentation ====================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display trailing whitespace
set list listchars=tab:->,trail:.,extends:>
set list

set nowrap                             " Don't wrap lines
set linebreak                          " Wrap lines at convenient points

" ==================== Folds =======================

set foldmethod=indent                  " Fold based on indent
set foldnestmax=3                      " Deepest fold is 3 levels
set nofoldenable                       " Don't fold by default

" ==================== Completion ====================

set wildmenu                           " Enable ctrl-n ctrl-p to scroll matches
set wildmode=list,longest

" ==================== Scrolling ====================

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ==================== Search ====================

set incsearch                          " Find next match as seach is typed
set hlsearch                           " Highlight searches by default
set ignorecase                         " Ignore case when searching...
set smartcase                          " ...unless capital character typed

" ==================== Custom Mappings ====================

" Have Y act like D and C, yank to EOL
map Y y$

" Map <F3> to also turn off search highlighting
nnoremap <F3> :nohl<CR>

" Map <F7> to reindent the entire file
map <F7> mzgg=G`z<CR>

" Navigate submenus with j,k
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" Strip trailing whitespace on write
function! <SID>StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Cleanup: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespace()

" ==================== Colors ====================

" Highlight characters over 80
let &colorcolumn=join(range(81,100), ",")
highlight ColorColumn ctermbg=237 guibg=#323232

set background=dark
colorscheme behelit

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

