" A command to install vim-plug if it's not installed already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Remap leader to ,
let mapleader = ","

" = Vim Plug Section =
call plug#begin()
if has('nvim')
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

Plug 'romainl/vim-qf'
"  == Language Support ==
Plug 'ycm-core/YouCompleteMe'
" Syntax support for OpenGL scripting language
Plug 'tikhomirov/vim-glsl'
" Better c++ syntax
Plug 'octol/vim-cpp-enhanced-highlight'
" Vim Kotlin support
Plug 'udalov/kotlin-vim'
" Vim Python completion, static analysis checker
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deathlyfrantic/deoplete-spell'
" Python PEP8 Indentation
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'psf/black', { 'branch': 'stable' }

" Enhancement for tags
" Plug 'ludovicchabant/vim-gutentags'
" Awesome tagbar
" Plug 'majutsushi/tagbar'
" Rust support
Plug 'rust-lang/rust.vim'
" YAML support
Plug 'stephpy/vim-yaml'
" Format c/c++ code easier
Plug 'rhysd/vim-clang-format'
" Switch between source and header files
Plug 'derekwyatt/vim-fswitch'
" HTML5 support
Plug 'othree/html5.vim'
" Markdown support
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" GLFW support
Plug 'bfrg/vim-glfw-syntax'
" Colorscheme
" Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
" Plug 'lifepillar/vim-solarized8'
Plug 'lifepillar/vim-gruvbox8'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'jsit/toast.vim'
Plug 'NLKNguyen/papercolor-theme'

" Maybe the best auto-completion framework
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"  == Productivity ==
Plug 'tpope/vim-fugitive'
" Write wiki inside Vim!
Plug 'vimwiki/vimwiki'
" A enhancement for listing taskwarrior tasks inside Vim!
"Plug 'blindFS/vim-taskwarrior' "Huge performance issue
Plug 'tools-life/taskwiki'
" Integrate tig into Vim
Plug 'iberianpig/tig-explorer.vim'
" nnn file manager
Plug 'mcchrish/nnn.vim'
" File Viewer inside Vim!
"Plug 'preservim/nerdtree'
" Faster movement
Plug 'easymotion/vim-easymotion'
" FZF support
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Awesome vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'
" Able to toggle the split to maximize it
Plug 'szw/vim-maximizer'
" Display the color of the color codes
"Plug 'ap/vim-css-color'
" {{{ ultisnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}
"  == Appearance ==
" Enhancement for statusbar
Plug 'itchyny/lightline.vim'

" == Mozilla Specific ==
" searchfox.org support
Plug 'kshvmdn/vim-searchfox'

" == Misc ==
" Hack leetcode inside vim
Plug 'ianding1/leetcode.vim'

"  == !! Need Revisit !! ==
Plug 'mbbill/undotree'
" Make submitting text to pastebins easier
Plug 'sefeng211/vim-pastebins'
" Plug 'airblade/vim-gitgutter'
Plug 'bogado/file-line'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'plasticboy/vim-markdown'
Plug 'kana/vim-operator-user'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

source ~/.my_vim_custom.vim

" = Plugin Specific Configuration =
" == gutentags ==
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

"" 所生成的数据文件的名称
"let g:gutentags_ctags_tagfile = '.tags'

"" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags

"" 配置 ctags 的参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
" if !isdirectory(s:vim_tags)
"    silent! call mkdir(s:vim_tags, 'p')
" endif

" == vim-cpp-enhanced-highlight ==
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1

" == fzf ==
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'sharp' } }

" == nnn ==
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
" == leetcode ==
let g:leetcode_browser = 'firefox-nightly'
let g:leetcode_solution_filetype = 'python'

" == vimwiki ==
let g:vimwiki_list = [{'path': '~/.local/Dropbox/wiki/mozilla/'},
            \ {'path': '~/.local/Dropbox/wiki/personal/'}]

let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}

nmap <leader>wl <Plug>VimwikiToggleListItem
let g:vimwiki_listsyms = ' ○◐●✓'

" == deoplete ==
let g:deoplete#enable_at_startup = 1

"" disable deoplete for c and cpp to let YCM takes care of them
autocmd FileType c,cpp,rust,hpp,h
\ call deoplete#custom#buffer_option('auto_complete', v:false)

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" == YouCompleteMe ==
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "h":1,
            \ "hpp":1,
            \ "cpp":1,
            \ "rust":1,
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

map <C-]> :YcmCompleter GoToImprecise<CR>
nnoremap <Leader>cr :YcmCompleter RefactorRename<space>

" == asyncrun ==
let g:asyncrun_open = 24

" == vim-markdown ==
" Disable vim markdown folding
let g:vim_markdown_folding_disabled = 1
let g:mkdp_browser = 'firefox-nightly'

" == vim-clang-format ==
let g:clang_format#code_style = "mozilla"

" == vim-pastebins ==
let g:enabled_pastebin_service = "mozilla"

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

" == Taskwiki ==
let g:taskwiki_disable_concealcursor = "yes"
let g:taskwiki_sort_orders={"U": "urgency-,due-"}

" == vim lightline ==
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'subseparator': { 'left': "❯", 'right': "❮" },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }
" = File Specific Configuration =
"
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

autocmd FileType cpp setlocal ts=8 sts=2 et sw=2 tw=80
autocmd FileType javascript setlocal ts=8 sts=2 et sw=2 tw=80 nowrap
autocmd FileType vimwiki setlocal ts=8 sts=2 et sw=2 tw=80 nowrap spell
autocmd FileType html setlocal ts=8 sts=2 et sw=2 tw=80 nowrap
autocmd FileType tin setlocal fileencoding=gb2312
"Set the filetype for jsm files as js
autocmd BufRead,BufNewFile *.jsm set filetype=javascript
" Clang format keybinding
autocmd FileType c,cpp,objc,rust nnoremap <buffer><Leader>cf :<C-u>MyFormatCode<CR>
autocmd FileType c,cpp,objc,rust vnoremap <buffer><Leader>cf :ClangFormat<CR>
"VIM YAML indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vim setlocal ts=4 sts=4 sw=4 expandtab
" = Colorscheme Configuration =

" Type jj to escape
imap jj <Esc>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" A nice trick to do indentation in visual mode
vnoremap < <gv
vnoremap > >gv

" *.cpp 和 *.h 间切换
nnoremap <silent> <Leader>sw :FSHere<cr>
nnoremap <silent> <Leader>pr :PrettierAsync<cr>

"Tab navigation mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Spell Check Key bindings
nnoremap <leader>sc :setlocal spell! spelllang=en_us<CR>

" FZF
nnoremap <leader>ff :Files <CR>
nnoremap <leader>fc :History: <CR>
nnoremap <leader>fs :History/ <CR>
nnoremap <leader>fr :History <CR>
nnoremap <leader>fi :BTags <CR>
nnoremap <leader>fp :Snippets <CR>
nnoremap <leader>b :Buffers <CR>
nnoremap <leader>r :Rg <CR>
nnoremap <leader>fl :noh <CR>

" SFSearch, search the word in searchfox
nnoremap <leader>sf :SFSearch <CR>
" SFOpen, search the file in searchfox
nnoremap <leader>ss :SFOpen <CR>

" == Tig-Explorer ==
" open tig with current file
nnoremap <Leader>tT :TigOpenCurrentFile<CR>

" open tig with Project root path
nnoremap <Leader>tt :TigOpenProjectRootDir<CR>

" Leetcode keybindings
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

xnoremap <leader>ps :<C-U>PastebinPaste<cr>
nnoremap <leader>pl :PastebinPasteList<cr>

"nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <leader>pb :call Post_text_visual()<cr>

" Open file in the directory which is same as the current buffer
vnoremap ,e :e <C-R>=expand("%:p:h") . "/" <CR>

" Use system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

" Move lines
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Toggle maximizing the split
nnoremap <silent><C-w>z :MaximizerToggle<CR>
vnoremap <silent><C-w>z :MaximizerToggle<CR>gv
inoremap <silent><C-w>z <C-o>:MaximizerToggle<CR>

nnoremap <Leader>q :bd!<CR>

noremap <Leader>sl :set lines=40<CR>


nnoremap <silent> <C-w>T :tab split<CR>

nnoremap <silent> <Leader>gww :%norm! gww<CR>

command! Reload execute "source ~/.vimrc"
command! Config execute ":e $MYVIMRC"

nnoremap <leader>gt :tab term ++close tig<CR>

noremap <Leader>wu :vertical resize +10<CR>
noremap <Leader>wi :vertical resize -10<CR>

" <Space>w
noremap <Space>wd :!wd<Space>

" <Space>g
map <Space>n :bn<cr>
map <Space>p :bp<cr>
map <Space>d :bd<cr>

" Quickfix
noremap <leader>tn :cnext<CR>
noremap <leader>tl :clast<CR>
noremap <leader>to :copen<CR>
noremap <leader>ts :cfirst<CR> :cnext<CR>
noremap <leader>tp :cprevious<CR>
noremap <leader>te :cclose<CR>

" AsyncTask
noremap <Leader>pac :AsyncTask project-build<CR>
noremap <Leader>par :AsyncTask project-run<CR>

"=============== Custom Configuration ==========
set pyxversion=3
set encoding=utf-8
set number
set scrolloff=10
set ignorecase
set hlsearch
set cursorline
set hidden
set relativenumber             " Show relative line numbers
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

hi CursorLine   cterm=NONE ctermbg=8 ctermfg=NONE
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

set completeopt-=preview

" = Hacks =
" Function that remove trailing spaces and also keep the cursor position
" Reference: https://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
" Apply the above function to all files during file saving
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Use :BDE! Replacing Current Buffer
function! ReplaceBuffer(bang, newfile)
    let curbuf = bufnr('%')
    exec "e " . a:newfile
    exec "bd" . a:bang . " " . curbuf
endfunction
command! -nargs=1 -complete=file -bang -bar BDE call ReplaceBuffer('<bang>', <f-args>)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)


set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set splitbelow splitright

" To enable true color in Vim, note not Neovim
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set autoread
filetype plugin on

highlight clear LineNR
highlight LineNr ctermfg=grey

" Abbreviations
" ===============
iabbrev adn and
iabbrev waht what
iabbrev tehn then

set noshowmode
set laststatus=2
set shortmess+=c "Disable some annoying error message from deoplete

" ColorScheme gruvbox {{{
" let g:gruvbox_transp_bg = 1
" syntax on
" set background=dark
" colorscheme gruvbox8_soft
" }}}


" ColorScheme nord {{{
syntax on
colorscheme nord
" Set the background to be transparent
hi Normal guibg=NONE ctermbg=NONE
"}}}
"
" vimwiki colorscheme {{{
" hi VimwikiHeader1 guifg=#D79921
" hi VimwikiHeader2 guifg=#689D6A
" hi VimwikiHeader3 guifg=#B16286
" hi VimwikiHeader4 guifg=#98971A
" hi VimwikiHeader5 guifg=#458588
" hi VimwikiHeader6 guifg=#CC241D
" }}}
"
"
autocmd! FileType qf setlocal wrap

" {{{ Trick to auto-toggle paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
" }}}

hi Terminal guibg=#2E3440


nmap [l <Plug>qf_loc_previous
nmap ]l <Plug>qf_loc_next
nmap ,cp <Plug>QfCprevious
nmap ,cn <Plug>QfCnext

nmap ,jp <Plug>(qf_qf_switch)
nmap ,cc <Plug>(qf_qf_toggle)

