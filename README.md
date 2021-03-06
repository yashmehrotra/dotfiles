# dotfiles

Pre Install:

1. Oh-my-zsh
2. Neovim
3. Terminator
4. Git
5. FZF
6. Vim-plug

Software:
1. Firefox
2. VLC
3. Dbox
4. Docker
5. Spotify

Usage:

1. Install GNU Stow
2. `stow $package`

Vim:

1. Install `vim-plug` from https://github.com/junegunn/vim-plug
2. FZF Install, pip install neovim, fzf in zshrc for rev search
3. virtualenv -p python3 ~/.virtualenvs/nvim
4. workon nvim && pip install neovim
4. Open `nvim` and run `:PlugInstall`

To Configure Coc, install the following LSPs

https://github.com/hashicorp/terraform-ls
gopls for golang


Neovim plugins to look out for
- Plug 'nvim-telescope/telescope.nvim' --> Replacement for file search with preview
- Plug 'neovim/nvim-lspconfig'
- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
- Plug 'nvim-treesitter/playground'

Todo for vim:
- Format selection does not work
- Integrate code folding
- ctags
