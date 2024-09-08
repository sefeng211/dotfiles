call plug#begin("~/.nvim/plugged")
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Quickfix
Plug 'kevinhwang91/nvim-bqf' " Provides preview and some handy mappings
Plug 'romainl/vim-qf' " Provides functions to toggle quickfix etc

Plug 'junegunn/goyo.vim'
Plug 'preservim/tagbar'

" Plug 'lilydjwg/fcitx.vim', { 'branch': 'fcitx5' }

Plug 'vimwiki/vimwiki'
" FZF support
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"
Plug 'christoomey/vim-tmux-navigator'

" Use for status bar
Plug 'tjdevries/express_line.nvim'

" Better c++ syntax
Plug 'octol/vim-cpp-enhanced-highlight'

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

Plug 'tpope/vim-fugitive'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'rust-lang/rust.vim'

Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

" Switch between source and header files
Plug 'derekwyatt/vim-fswitch'

Plug 'szw/vim-maximizer'

Plug 'tpope/vim-unimpaired'
Plug 'alvan/vim-closetag'

Plug 'preservim/nerdcommenter'

Plug 'ianding1/leetcode.vim'

Plug 'pangloss/vim-javascript'

Plug 'vhyrro/neorg-telescope'
Plug 'nvim-neorg/neorg'

" LSP Related
Plug 'neovim/nvim-lspconfig'
Plug 'deoplete-plugins/deoplete-lsp'

" Color Scheme
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'casonadams/nord.vim'
" Plug 'shaunsingh/nord.nvim'
" Plug 'cocopon/iceberg.vim'
Plug 'andersevenrud/nordic.nvim'

" Color syntax for sxhkdrc
Plug 'baskerville/vim-sxhkdrc'

"Snippet
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'fhill2/telescope-ultisnips.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'sefeng211/jk.vim', { 'do': 'pip install pynput' }

" Plug 'github/copilot.vim'

Plug 'sindrets/diffview.nvim'

call plug#end()
