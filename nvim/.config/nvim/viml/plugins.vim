call plug#begin("~/.nvim/plugged")
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Quickfix
Plug 'kevinhwang91/nvim-bqf' " Provides preview and some handy mappings
Plug 'romainl/vim-qf' " Provides functions to toggle quickfix etc

Plug 'junegunn/goyo.vim'
Plug 'preservim/tagbar'

Plug 'lilydjwg/fcitx.vim', { 'branch': 'fcitx5' }

Plug 'vimwiki/vimwiki'
" FZF support
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'

" Use for status bar
Plug 'tjdevries/express_line.nvim'

" Better c++ syntax
Plug 'octol/vim-cpp-enhanced-highlight'

" Format c/c++ code easier
" Plug 'rhysd/vim-clang-format'

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
" Plug 'ycm-core/YouCompleteMe'

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
Plug 'alvan/vim-closetag'

Plug 'ianding1/leetcode.vim'

Plug 'pangloss/vim-javascript'

Plug 'vhyrro/neorg-telescope'
Plug 'nvim-neorg/neorg'

" LSP Related
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()
