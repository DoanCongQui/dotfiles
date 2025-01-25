set number
set mouse=a                 " Enable mouse
set expandtab               " Tab setting 
set tabstop=4               " Tab setting 
set shiftwidth=4            " Tab setting
set listchars=tab:\¦\       " Tab charactor

syntax on

call plug#begin('~/.vim/plugged')
  Plug 'joshdick/onedark.vim',                  " Dark theme
  Plug 'dracula/vim', { 'name': 'dracula' }
  " File search
  Plug 'junegunn/fzf', 
    \ { 'do': { -> fzf#install() } }            " Fuzzy finder 
  Plug 'junegunn/fzf.vim'

  " Terminal
  Plug 'voldikss/vim-floaterm'                  " Float terminal

  " Status bar
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'

  " File browser
  Plug 'preservim/nerdTree'                     " File browser  
  Plug 'Xuyuanp/nerdtree-git-plugin'            " Git status
  Plug 'ryanoasis/vim-devicons'                 " Icon
  Plug 'unkiwii/vim-nerdtree-sync'              " Sync current file 
  Plug 'jcharum/vim-nerdtree-syntax-highlight',
    \ {'branch': 'escape-keys'}

  " Code intellisense
  Plug 'neoclide/coc.nvim', 
    \ {'branch': 'release'}                     " Language server protocol (LSP) 
  Plug 'jiangmiao/auto-pairs'                   " Parenthesis auto
  Plug 'preservim/nerdcommenter'                " Comment code

  " Code syntax highlight
  Plug 'sheerun/vim-polyglot'
  Plug 'uiiaoo/java-syntax.vim'
  Plug 'jackguo380/vim-lsp-cxx-highlight'

  " Source code version control 
  Plug 'tpope/vim-fugitive'                     " Git infomation 
  Plug 'tpope/vim-rhubarb' 
  Plug 'airblade/vim-gitgutter'                 " Git show changes 
  Plug 'samoshkin/vim-mergetool'                " Git merge 

  " Debugging
  Plug 'puremourning/vimspector'                " Vimspector
  Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

  " Live server
  Plug 'https://github.com/wolandark/vim-live-server.git'
call plug#end()


" colorscheme onedark
colorscheme onedark
highlight Normal ctermbg=none guibg=none

let g:python_highlight_all = 1
highlight link javaIdentifier NONE

let g:coc_global_extensions = ['coc-pyright']

" autocmd BufWritePost *.html,*.css,*.js silent! :StartBrowserSync

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor
