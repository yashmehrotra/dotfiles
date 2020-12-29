" Vim configuration of Yash Mehrotra
" Partly inspired by - http://dougblack.io/words/a-good-vimrc.html

"========"
" Colors "
"========"

set t_Co=256                             " Important setting for running in Terminal (helps in converting color to 256 bit ) - took me 3 hours to set it right
syntax enable                            " enable syntax processing

set background=dark                      " For colorscheme

"==============="
" Cursor        "
"==============="

set guicursor=a:hor25                    " set cursor as underline

"==============="
" Spaces & Tabs "
"==============="

set tabstop=4                            " number of visual spaces per TAB
set softtabstop=4                        " number of spaces in tab when editing
set expandtab                            " tabs are spaces
set smartindent                          " automatically indents the next line to the current indentation
set shiftwidth=4                         " control how many columns text is indented with the reindent operations

"===========" 
" UI Config "
"==========="

set number                               " show line numbers
set showcmd                              " show command in bottom bar
set cursorline                           " highlight current line
filetype indent on                       " load filetype-specific indent files
set wildmenu                             " visual autocomplete for command menu
set lazyredraw                           " redraw only when we need to
set showmatch                            " highlight matching [{()}]
set nowrap                               " because sometimes I hate word-wrapping
set ruler                                " show column numbers

"==========="
" Searching "
"==========="

set incsearch                            " search as characters are entered
set nohlsearch                           " highlight matches

"================="
" No category yet "
"================="

set mouse+=a                              " line numbers do not get copied

"=========="
" Vim-Plug "
"=========="

filetype off

call plug#begin()
" File Tree Navigation
Plug 'scrooloose/nerdtree'

" Fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi', {'do': ':UpdateRemotePlugins'}

" Terraform
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

" Miscellaneous
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'

call plug#end()

colorscheme gruvbox
filetype plugin indent on

"=========="
" Deoplete "
"=========="

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog= '/home/yash/.virtualenvs/nvim/bin/python'

"====="
" FZF "
"====="

map <C-f> :FZF<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"=========="
" NerdTree "
"=========="

" Open on default
" autocmd vimenter * NERDTree

let NERDTreeShowHidden = 1
map <C-x> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"========"
" Python "
"========"

let g:jedi#use_splits_not_buffers = "left"
let g:jedi#goto_command = "gd"
let g:jedi#usages_command = "gu"
let g:jedi#documentation_command = "gk"

"========"
" Golang "
"========"

au FileType go nmap gu <Plug>(go-referrers)
au FileType go nmap gk <Plug>(go-doc-split)
" Use gopls when it is more mature
" Also check if this is the default (it prints when you do gd)
" Defined in vim-go file: autoload/go/config.vim
" let g:go_def_mode='gopls'

"========="
" Airline "
"========="

let g:airline_theme = "badwolf"

autocmd FileType python setlocal completeopt-=preview
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab indentkeys-=<:>
