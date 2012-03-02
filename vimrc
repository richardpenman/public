set encoding=utf8

set textwidth=0
set tabstop=4		" Number of spaces to expand tab (messy)
set softtabstop=4	" Number of spaces for insert for tab
set shiftwidth=4	" Number of spaces for << or >>
set expandtab

set ruler
set autoindent	    
set nocompatible        " use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
set vb          " turn off bell
set guifont=Monospace\ 12   " determined with 'set gfn'
syntax on               " switch syntax highlighting on

" searching options
set nowrapscan	    
set ignorecase

" use ALT key to treat wrapped text as new line when traversing
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gji

" disable indentation for pasting with f2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" for working with Windows line endings
autocmd BufReadPost * nested
      \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc')) |
      \   let b:reload_dos = 1 |
      \   e ++ff=dos |
      \ endif


" Protect large files from sourcing and other overhead.
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
  endif
