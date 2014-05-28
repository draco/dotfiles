set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'docunext/closetag.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'L9'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
" Put your non-Plugin stuff after this line
"
let mapleader = "\<Space>"
set autoindent
set background=dark
set number
set t_Co=256
set pastetoggle=<F2>
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom."
set laststatus=2          " last window always has a statusline"
set smarttab              " use tabs at the start of a line, spaces elsewhere"
set smartindent
set clipboard+=unnamed
set cursorcolumn
set cursorline
set colorcolumn=80
set nobackup     " turn backup off, since most stuff is in vcs
set nowb
set noswapfile

let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_bold = "1"
colorscheme solarized

nnoremap j gj
nnoremap k gk

map <C-n> :NERDTreeToggle<CR>
map <C-f> :Ag
map <Leader>r :NERDTreeFind<CR>
map <Leader>t :tabnew<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :wq<CR>
nnoremap <CR> G
nnoremap <BS> gg

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Copy paste with <Space>y/p
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
set wildignore+=*/vendor/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

if has("autocmd")
  " enable file type detection
  filetype on

  " syntax of these languages is fussy over tabs vs spaces
  autocmd FileType make setlocal ts=2 sts=2 sw=2 noet

  " remove trailing spaces when saved
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

  " return to last edit position when opening files
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
endif

function! <SID>StripTrailingWhitespaces()
  " preparation: save last search, and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  " do the business
  %s/\s\+$//e

  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
