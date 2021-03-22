" Custom commands
command! Reload execute "source ~/.config/nvim/init.vim"

" AUTOCMD
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

autocmd FileType rust nnoremap <buffer><Leader>cf :<C-u>RustFmt<CR>
autocmd FileType rust vnoremap <buffer><Leader>cf :RustFmt<CR>

" = Hacks =
" Function that remove trailing spaces and also keep the cursor position
" Reference: https://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)
autocmd FileType c,cpp,rust,hpp,h,python call deoplete#custom#buffer_option('auto_complete', v:false)
au BufReadPost,BufNewFile *.wiki TagbarOpen
