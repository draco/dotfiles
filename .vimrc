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
Plugin 'tpope/vim-markdown'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'docunext/closetag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'L9'
Plugin 'rking/ag.vim'
Plugin 'Shougo/neocomplete.vim'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'

Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'

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
set encoding=utf-8

colorscheme spacegray

" Custom color scheme overrides
hi LineNr          ctermbg=NONE ctermfg=239      guibg=#111314  guifg=#3E4853  cterm=NONE      gui=NONE
hi CursorColumn    ctermbg=237   ctermfg=NONE   guibg=NONE  guifg=NONE     cterm=NONE      gui=NONE
hi CursorLine      ctermbg=236    ctermfg=NONE   guibg=NONE  guifg=NONE     cterm=NONE      gui=NONE
hi Directory       ctermbg=NONE ctermfg=242     guibg=NONE     guifg=#5FAFAF  cterm=NONE      gui=NONE
hi Normal          ctermbg=NONE ctermfg=NONE  guibg=NONE  guifg=NONE  cterm=NONE      gui=NONE

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=128
" set ttyfast " u got a fast terminal
" set ttyscroll=3
" set lazyredraw " to avoid scrolling problems
" ruby path if you are using RVM
let g:ruby_path = system('rvm current')

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" vim-javascript
let g:javascript_enable_domhtmlcss = 1

" javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,jquery,react,chai'

" vim-jsx
let g:jsx_ext_required = 0

" Markdown
let g:markdown_fenced_languages = ['css', 'html', 'xhtml', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']
let g:syntastic_aggregate_errors = 1

nnoremap j gj
nnoremap k gk

imap jk <esc> " map jk to esc

map <C-n> :NERDTreeToggle<CR>
map <C-f> :Ag
map <Leader>r :NERDTreeFind<CR>
map <Leader>t :tabnew<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :wq<CR>

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "<TAB>"

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
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|node_modules\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
set wildignore+=*/vendor/bundle/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

if has("autocmd")
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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

if exists("+showtabline")
  function MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= '  '
      let s .= i . ')'
      let s .= '%*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let file = bufname(buflist[winnr - 1])
      let file = fnamemodify(file, ':p:t')
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!MyTabLine()
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
