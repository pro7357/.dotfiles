set encoding=utf-8
set nocompatible

map <Space> <Leader>

" PlugUpdate  	Install or update plugins
" PlugClean 	Remove unlisted plugins. vim will remove neovim plugin
" PlugClean!    clean without prompt
" PlugUpgrade 	Upgrade vim-plug itself

"https://github.com/junegunn/vim-plug
    "prox
call plug#begin('$HOME/.vim/plugged')
" Plug 'tpope/vim-fugitive'
" Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
" Plug 'scrooloose/nerdtree'
Plug 'TomNomNom/xoria256.vim'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        "require go get golang.org/x/tools/gopls@latest
        "manual go update on prox 2
    "Plug 'rust-lang/rust.vim'
    "set rtp+=$HOME/Adisc/j
endif

call plug#end()

" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

" Neovim Config
if has('nvim')
    let g:deoplete#enable_at_startup = 1
    " command! w!! w suda://%
    ca w!! w suda://%
    ca E e suda://%
else
    " :w !sudo tee % #% refer to the current file
    ca w!! w !sudo tee >/dev/null '%'
    set cryptmethod=blowfish2
    set wrap
endif


" Neovim only function
function! OnTabEnter(path)
  if isdirectory(a:path)
    let dirname = a:path
  else
    let dirname = fnamemodify(a:path, ":h")
  endif
  execute "tcd ". dirname
endfunction()

if has('nvim')
    autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))
endif

" Highlighting
syntax on

" History
set history=50

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu

" Line wrapping
"set nowrap
set linebreak
set showbreak=▹

" Auto indent what you can
set autoindent

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Enable jumping into files in a search buffer
set hidden 

set backspace=2
" Make backspace a bit nicer
set backspace=indent,eol,start

" Standard
set textwidth=120
set fileformat=unix

" Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

set mouse=a

" Colorscheme
if &t_Co == 256
    try
        color xoria256
    catch /^Vim\%((\a\+)\)\=:E185/
        " Oh well
    endtry
endif

" Default for speed
set nobackup
set noswapfile
set noundofile 

let $vimtmp='$HOME/.vim/tmp'
if !isdirectory('$HOME/.vim/tmp')
    call mkdir('/tmp/vimtmp', 'p')
    let $vimtmp='/tmp/vimtmp'
endif

" PEP8 indentation and overwrite default
au BufNewFile,BufRead *.py,*.sh,*.go
    \ set directory=$vimtmp |
    \ set backupdir=$vimtmp |
    \ set undodir=$vimtmp |
    \ set backup |
    \ set swapfile |
    \ set undofile

highlight BadWhitespace ctermbg=red guibg=red
" Mark whitespace in RED
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.sh,*.vim,*.go,*.md match BadWhitespace /\s\+$/

" Full stack development:
au BufNewFile,BufRead *.js,*.mjs,*.html,*.css,*.vim
            \ setlocal tabstop=2
            \ softtabstop=2
            \ shiftwidth=2
            \ directory=$vimtmp
            \ backupdir=$vimtmp
            \ undodir=$vimtmp
            \ backup
            \ swapfile
            \ undofile

let g:markdown_fenced_languages = ['python', 'bash=sh', 'css', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'xml', 'html']

" For markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype markdown setlocal nowrap
autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist
autocmd Filetype markdown setlocal columns=80
let g:vim_markdown_conceal = 0

" Trans background
hi Normal ctermbg=none
hi NonText ctermbg=none

" auto reload vimrc
au! Bufwritepost .vimrc source %
"set clipboard=unnamed
"set clipboard=unnamedplus
" Use <S-y> for yank only into buffer, not clipboard
vnoremap <silent> y "+y
nnoremap <silent> yy 0v$h"+y
inoremap <silent> <C-v> <Esc><S-C-v>a
" Save = :w = :update => Ctrl+s in normal, insert & visual
nmap <C-s> :update<CR><CR>
imap <C-s> <esc>:update<CR><CR>a
vmap <C-s> <esc>:update<CR><CR>gv

" stty -ixon in bash_profile, Ctrl-q if stuck

" Gundo toggle
"map <F5> <Esc>:GundoToggle<CR>

" Toggle line-wrap
map <F6> <Esc>:set wrap!<CR>

" Open file under cursor in new tab
"map <F9> <Esc><C-W>gF<CR>:tabm<CR>
map <F9> <Esc>gF<CR>:tabm<CR>

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj
"nnoremap <silent> <Up> gk
"nnoremap <silent> <Down> gj
"inoremap <silent> <Up> <C-c>gka
"inoremap <silent> <Down> <C-c>gja

nnoremap <Leader>o <Esc>:tabe 
cnoremap <silent> Q! :qall!<CR>
noremap <C-w> <Esc>:wq!<CR>
"nnoremap <Leader>h gT
"nnoremap <Leader>l gt
nnoremap <Leader>m :setlocal nu!<CR>
nnoremap <Leader>n :call TmpNum()<CR>

function! TmpNum()
    setlocal relativenumber
    redraw
    sleep 2
    setlocal norelativenumber
endfunction


" Base64 decode word under cursor
nmap <Leader>b :!echo <C-R><C-W> \| base64 -d<CR>

" grep recursively for word under cursor
nmap <Leader>g :tabnew\|read !grep -Hnr '<C-R><C-W>'<CR>

" Visual prompt for command completion
set wildmenu

" folding
set nofoldenable


    " nnoremap w ':"quit" !clipster -c<CR>'
if $VIMENV == 'prev'
    noremap <Space> :n<CR>
    noremap <Backspace> :N<CR>
    set noswapfile
elseif $VIMENV == 'vimview'
    noremap q :q!<CR>
    set noswapfile
elseif $VIMENV == 'j'
    set nonu
elseif $VIMENV == 'wrap'
    set wrap
endif

" set the interactive flag so bash functions are sourced from ~/.bashrc etc
"set shellcmdflag=-ci
