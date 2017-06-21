set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-markdown'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'docunext/closetag.vim'
Plugin 'L9'
Plugin 'kshenoy/vim-signature'
Plugin 'sheerun/vim-polyglot'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'valloric/matchtagalways'
Plugin 'rking/ag.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'easymotion/vim-easymotion'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
" Put your non-Plugin stuff after this line
"
let mapleader = "\<Space>"
set autoindent
set number " show line number
set t_Co=256
set pastetoggle=<F2>
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set smartcase             " Except if we use caps
set ruler                 " Always show info along bottom."
set laststatus=2          " last window always has a statusline"
set smarttab              " use tabs at the start of a line, spaces elsewhere"
set smartindent
set clipboard+=unnamed
set cursorcolumn " highlight current column
set cursorline " highlight current line
set colorcolumn=100
set nobackup     " turn backup off, since most stuff is in vcs
set nowb
set noswapfile
set encoding=utf-8
set synmaxcol=128 " stop highlighting syntax after this col
set lazyredraw " to avoid scrolling problems
set showmatch " highlight matching [{()}]
set wildmenu  " visual autocomplete for command menu

set showmode " show current mode

colorscheme spacegray

" Custom color scheme overrides
hi LineNr          ctermbg=NONE ctermfg=239      guibg=#111314  guifg=#3E4853  cterm=NONE      gui=NONE
hi CursorColumn    ctermbg=237   ctermfg=NONE   guibg=NONE  guifg=NONE     cterm=NONE      gui=NONE
hi CursorLine      ctermbg=236    ctermfg=NONE   guibg=NONE  guifg=NONE     cterm=NONE      gui=NONE
hi Directory       ctermbg=NONE ctermfg=242     guibg=NONE     guifg=#5FAFAF  cterm=NONE      gui=NONE
hi Normal          ctermbg=NONE ctermfg=NONE  guibg=NONE  guifg=NONE  cterm=NONE      gui=NONE
hi Visual term=reverse cterm=reverse

let g:airline_theme='minimalist'

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
let g:used_javascript_libs = 'lodash,react'

" vim-jsx
let g:jsx_ext_required = 0

" MatchTagAlways
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'eruby': 1, 'javascript.jsx': 1 }

" Markdown
let g:markdown_fenced_languages = ['css', 'html', 'xhtml', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

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
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|\.happypack\|vendor\/bundle|public\/images\|node_modules\|public\/system\|data\|coverage\|public\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.zip$\|\.dat$'
  \ }
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1

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

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
