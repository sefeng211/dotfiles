let mapleader = ","

imap jj <Esc>

" Speical case to use either telescope or fzf depends on the current working
" directory
nnoremap <leader>ff :lua require('functions').fuzzy_find_file()<CR>
" FZF 
nnoremap <leader>fr :History <CR>
nnoremap <leader>fc :History: <CR>
nnoremap <leader>r :Rg <CR>
nmap // :BLines<CR>
nmap cc :Commands<CR>

" Telescope
nnoremap <leader>bb :Buffers<cr>

" Taskoo related
nnoremap <leader>ttw :lua require('plugins.telescope.custom').taskoo_list_gtd_work()<cr>

" Use system clipboard
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p

" Spell Check Key bindings
nnoremap <leader>sc :setlocal spell! spelllang=en_us<CR>

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

" YouCompleteMe(YCM)
nnoremap <C-]> :YcmCompleter GoToImprecise<CR>
nnoremap <Leader>cr :YcmCompleter RefactorRename<space>

" AsyncTask
nnoremap <Leader>pac :AsyncTask project-build<CR>
nnoremap <Leader>par :AsyncTask project-run<CR>
nnoremap <Leader>pat :AsyncTask project-test<CR>

" deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Vimwiki
nmap <leader>wl <Plug>VimwikiToggleListItem

" A nice trick to do indentation in visual mode
vnoremap < <gv
vnoremap > >gv

" *.cpp 和 *.h 间切换
nnoremap <silent> <Leader>sw :FSHere<cr>
nnoremap <silent> <Leader>pr :PrettierAsync<cr>

" Toggle maximizing the split
nnoremap <silent><C-w>z :MaximizerToggle<CR>
vnoremap <silent><C-w>z :MaximizerToggle<CR>gv
inoremap <silent><C-w>z <C-o>:MaximizerToggle<CR>

" Sizing window horizontally
nnoremap <A-,> <C-W>5>
nnoremap <A-.> <C-W>5<

" Sizing window vertically taller
nnoremap <A-t> <C-W>+ " shorter
nnoremap <A-s> <C-W>- 

tnoremap <leader><leader> <C-\><C-n>
