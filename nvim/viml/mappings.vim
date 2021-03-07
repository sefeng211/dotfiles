let mapleader = ","

imap jj <Esc>

" Speical case to use either telescope or fzf depends on the current working
" directory
nnoremap <leader>ff :lua require('functions').fuzzy_find_file()<CR>
" FZF 
nnoremap <leader>fr :History <CR>
nnoremap <leader>fc :History: <CR>
nnoremap <leader>r :Rg <CR>

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
map <C-]> :YcmCompleter GoToImprecise<CR>
nnoremap <Leader>cr :YcmCompleter RefactorRename<space>

" AsyncTask
noremap <Leader>pac :AsyncTask project-build<CR>
noremap <Leader>par :AsyncTask project-run<CR>
noremap <Leader>pat :AsyncTask project-test<CR>
