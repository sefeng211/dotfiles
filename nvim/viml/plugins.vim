call plug#begin("~/.nvim/plugged")
Plug 'vimwiki/vimwiki'
" FZF support
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'

" Use for status bar
Plug 'nvim-lua/plenary.nvim'
Plug 'tjdevries/express_line.nvim'

" Telescope!!
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'mbbill/undotree'

Plug 'szw/vim-maximizer'

" nnn file manager
Plug 'mcchrish/nnn.vim'

" YCM is still soooo goood
Plug 'ycm-core/YouCompleteMe'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'rust-lang/rust.vim'

Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

" Switch between source and header files
Plug 'derekwyatt/vim-fswitch'

Plug 'szw/vim-maximizer'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
call plug#end()
