let mapleader = ","

imap jk <Esc>

" Speical case to use either telescope or fzf depends on the current working
" directory
nnoremap <leader>ff :lua require('functions').fuzzy_find_file()<CR>
" FZF
nnoremap <leader>fr :History <CR>
nnoremap <leader>fc :History: <CR>
nnoremap <leader>r :Rg <CR>
nmap // :BLines<CR>
" nmap cc :Commands<CR>

" Telescope
nnoremap <leader>bb :Buffers<cr>

" Taskoo related
nnoremap <leader>ttw :lua require('plugins.telescope.custom').taskoo_list_gtd_work()<cr>

" Use system clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p
inoremap <leader>y "+y
inoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p

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

" AsyncTask
nnoremap <Leader>mbd :AsyncTask moz-build-debug<CR>
nnoremap <Leader>mbr :AsyncTask moz-build-release<CR>
nnoremap <Leader>ps :AsyncStop<CR>
nnoremap <Leader>pr :AsyncTask project-run<CR>
nnoremap <Leader>pt :AsyncTask project-test<CR>

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
" nnoremap <A-t> <C-W>+ " shorter
" nnoremap <A-s> <C-W>-

" Switch from terminal mode to normal mode
tnoremap <leader><leader> <C-\><C-n>

" Quickfix
" noremap <leader>cn :cnext<CR>
noremap <leader>cl :clast<CR>
noremap <leader>cs :cfirst<CR> :cnext<CR>
noremap <leader>cp :cprevious<CR>
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <leader>qq :call ToggleQuickFix()<cr>

noremap <leader>qp <Plug>(qf_qf_previous)
noremap <leader>qn <Plug>(qf_qf_next)
noremap <leader>qo <Plug>(qf_qf_toggle)


nmap [l <Plug>qf_loc_previous
nmap ]l <Plug>qf_loc_next
nmap [q <Plug>qf_qf_previous
nmap ]q <Plug>qf_qf_next

let g:qf_mapping_ack_style = 1
" Goyo
noremap <leader>gg :Goyo<CR>

" Tagbar
noremap <leader>tg :TagbarToggle<CR>

" Vim-qf
nmap [q <Plug>QfCprevious
nmap ]q <Plug>QfCnext

nmap <leader>co <Plug>(qf_qf_switch)
nmap <leader>cc <Plug>(qf_qf_toggle)

" Leetcode keybindings
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

" Tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Snippet
nnoremap <leader>sp :Telescope ultisnips<CR>
