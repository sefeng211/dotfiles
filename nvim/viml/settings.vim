" {{{ Settings
set number
set relativenumber
set scrolloff=10
set hlsearch
set cursorline
set hidden
set nowrap
set undodir=~/.nvim/undodir
set undofile
set smartindent
set ignorecase
set noswapfile
set nobackup
set incsearch
set noshowmode
set nocompatible
set completeopt-=preview " Disable the scratch window for completion
set tabstop=4
set shiftwidth=4
set expandtab
" }}}

" {{{ Colorscheme 
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme nord
" Required to make the background transparent
hi Normal guibg=NONE ctermbg=NONE
" }}}

" Plugin Settings
"   Deoplete
let g:deoplete#enable_at_startup = 1

"   NNN File Manager
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" == YouCompleteMe ==
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "h":1,
            \ "hpp":1,
            \ "cpp":1,
            \ "rust":1,
	    \ "python":1
            \ }
let g:ycm_show_diagnostics_ui = 0
let g:ycm_hover_popup = -1
let g:ycm_auto_hover = -1
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_max_num_identifier_candidates = 5
let g:ycm_max_num_candidates = 10
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_language_server =
            \ [
            \   {
            \     'name': 'rust',
            \     'cmdline': ['rust-analyzer'],
            \     'filetypes': ['rust'],
            \     'project_root_files': ['Cargo.toml']
            \   }
            \ ]

" == asynctask ==
let g:asynctasks_term_pos = "tab"
let g:asynctasks_term_reuse = 1
let g:asynctasks_template = {}
let g:asynctasks_template.cargo = [
			\ "[project-init]",
			\ "command=cargo update",
			\ "cwd=<root>",
			\ "",
			\ "[project-build]",
			\ "command=cargo build",
			\ "cwd=<root>",
			\ "errorformat=%. %#--> %f:%l:%c",
			\ "",
			\ "[project-run]",
			\ "command=cargo run",
			\ "cwd=<root>",
			\ "output=terminal",
			\ ]

" == vimwiki ==
let g:vimwiki_list = [{'path': '~/.local/Dropbox/wiki/mozilla/'},
            \ {'path': '~/.local/Dropbox/wiki/personal/'}]

let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}

let g:vimwiki_listsyms = ' ○◐●✓'

" == Firenvim ==
if has('nvim')
    let g:firenvim_config = {
        \ 'globalSettings': {
            \ 'alt': 'all',
        \  },
        \ 'localSettings': {
            \ '.*': {
                \ 'cmdline': 'neovim',
                \ 'priority': 0,
                \ 'selector': 'textarea',
                \ 'takeover': 'never',
            \ },
        \ }
    \ }
    let fc = g:firenvim_config['localSettings']
    let fc['https?://[^/]+\.zhihu\.com/*'] = { 'takeover': 'never', 'priority': 1 }
    let fc['https?://chat\.mozilla\.org/*'] = { 'takeover': 'never', 'priority': 1 }
    let fc['https?://app\.slack\.com/*'] = { 'takeover': 'never', 'priority': 1 }
    let fc['https?://app\.element\.io/*'] = { 'takeover': 'never', 'priority': 1 }
endif
