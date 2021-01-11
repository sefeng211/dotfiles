function! My_format_code()
    if &filetype=='cpp'
        execute ":ClangFormat"
    elseif &filetype=='c'
        execute ":ClangFormat"
    elseif &filetype=='objc'
        execute ":ClangFormat"
    elseif &filetype=='rust'
        execute ":RustFmt"
    endif
endfunction

execute "command! MyFormatCode :call My_format_code()"
