let g:floaterm_position = 'topright'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.8
let g:floaterm_title = 'Terminal $1/$2'
let g:floaterm_wintype = 'float'
let g:floaterm_rootmarkers = ['.pro']
if has('win32')
	let g:floaterm_shell = 'powershell -nologo'
endif

" Set color
hi Floaterm guibg=Grey15
hi FloatermBorder guifg=Orange guibg=DarkGreen
"hi FloatermNC guibg=darkred

autocmd User FloatermOpen        " triggered after opening a new/existed floater

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hotkey to manage terminals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a new terminal 
"nnoremap <silent>     :FloatermNew<CR>
"tnoremap <silent>     <C-\><C-n>:FloatermNew<CR>

" Kill current terminal 
nnoremap <silent> <C-S-p> :FloatermKill<CR>
tnoremap <silent> <C-S-p> <C-\><C-n>:FloatermKill<CR>

nnoremap <silent> <M-p> :FloatermKill<CR>
tnoremap <silent> <M-p> <C-\><C-n>:FloatermKill<CR>

" Navigation next and previous terminal 
nnoremap <silent> <leader>tn :FloatermNext<CR>
tnoremap <silent> <leader>tn <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <leader>tp :FloatermPrev<CR>
tnoremap <silent> <leader>tp <C-\><C-n>:FloatermPrev<CR>

" Toggle terminal
nnoremap <silent> <C-p> :FloatermToggle<CR>
tnoremap <silent> <C-p> <C-\><C-n>:FloatermToggle<CR>

" Focus terminal 
nnoremap <silent> <leader>tf <C-\><C-n><C-W><Left>
tnoremap <silent> <leader>tf <C-\><C-n><C-W><Left>

let g:floaterm_keymap_new = '<Leader>ft'


