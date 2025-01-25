vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>

nnoremap = <C-w>>

" Copy and Cut to clipboard
nnoremap <C-c> "+y :echo "Text copied to clipboard"<CR>
vnoremap <C-c> "+y :echo "Text copied to clipboard"<CR>
nnoremap <C-x> "+d :echo "Text cut to clipboard"<CR>
vnoremap <C-x> "+d :echo "Text cut to clipboard"<CR>

" Live server
nmap <F2> :StartLiveServer <CR>
nmap <F3> :KillLiveServer <CR>

nmap <F2> :StartBrowserSync <CR>
nmap <F3> :KillBrowserSync <CR>
" Run code C C++ Java HTML Go python
map <C-b> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"

" Run C 
if &filetype == 'c'
exec "!gcc % -o a.out -lm"
        if v:shell_error
            echohl ErrorMsg | echom "Compilation failed!" | echohl None
        else
            echohl Question | echom "Execution successful!" | echohl None
        endif

" Run C++
elseif &filetype == 'cpp'
exec "!g++ % -o a.out"
        if v:shell_error
            echohl ErrorMsg | echom "Compilation failed!" | echohl None
        else
            echohl Question | echom "Execution successful!" | echohl None
        endif

elseif &filetype == 'java'
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!time python3 %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc
