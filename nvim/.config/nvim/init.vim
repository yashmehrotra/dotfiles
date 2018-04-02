" Vim configuration of Yash Mehrotra
" Partly inspired by - http://dougblack.io/words/a-good-vimrc.html

"========"
" Colors "
"========"


set t_Co=256                             " Important setting for running in Terminal (helps in converting color to 256 bit ) - took me 3 hours to set it right
syntax enable                            " enable syntax processing
" Because GVim
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    " Uncomment the below and comment the badwolf
    set background=dark
    "let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    "let g:solarized_contrast="high"
    "let g:solarized_visibility="high"
    "let g:solarized_termcolors=256
    "colorscheme gruvbox
    colorscheme badwolf                  " color setting by Steve Losh - https://github.com/sjl/badwolf/blob/master/colors/badwolf.vim
endif

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
call plug#end()
filetype plugin indent on

"====="
" FZF "
"====="

map <C-f> :FZF<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }


"=========="
" Nerdtree "
"=========="

" Open on default
" autocmd vimenter * NERDTree
map <C-x> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


autocmd FileType python setlocal completeopt-=preview
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
