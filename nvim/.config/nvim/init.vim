" Vim configuration of Yash Mehrotra
" Partly inspired by - http://dougblack.io/words/a-good-vimrc.html

"========"
" Colors "
"========"

set t_Co=256                             " Important setting for running in Terminal (helps in converting color to 256 bit ) - took me 3 hours to set it right
syntax enable                            " enable syntax processing

set background=dark
"colorscheme gruvbox
colorscheme badwolf                  " color setting by Steve Losh - https://github.com/sjl/badwolf/blob/master/colors/badwolf.vim

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

"se mouse+=a                              " line numbers do not get copied
"execute pathogen#infect()

"=========="
" Vim-Plug "
"=========="

filetype off

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'derekwyatt/vim-scala'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
" Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Yggdroot/indentLine'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'python-mode/python-mode', { 'branch': 'develop' }
call plug#end()

filetype plugin indent on

let g:deoplete#enable_at_startup = 1

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
" Nerdtree "
"=========="

" Open on default
" autocmd vimenter * NERDTree
map <C-x> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"========"
" Python "
"========"
"
call pymode#default('g:pymode_rope', 1)
let g:pymode_options_colorcolumn = 0
let g:pymode_rope_goto_def_newwin = 'vnew'
let g:pymode_rope_goto_definition_bind = 'gd'
let g:pymode_rope_goto_definition_cmd = 'vsplit'
let g:pymode_lint_on_write = 1

autocmd FileType python setlocal completeopt-=preview
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
