let mapleader=","

set nocompatible
set encoding=utf-8
set number

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" turn in incremental search with smart case
set incsearch
set ignorecase
set smartcase

" better statusline
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" setup pathogen
filetype plugin indent on
call pathogen#runtime_append_all_bundles()

" enable solarized
syntax enable
set background=light
colorscheme solarized

" highlight the current line
set cursorline

" make uses real tabs
au FileType make set noexpandtab

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkdown()
  set filetype=markdown
  call s:setupWrapping()
endfunction

au BufRead,BufNewFile *.txt call s:setupWrapping()
au BufRead,BufNewFile *.{markdown,md,mdown,mkd,mknd} call s:setupMarkdown()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

set colorcolumn =+1

map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

function! ToggleScratch()
  if expand('%') == g:ScratchBufferName
    quit
  else
    Sscratch
  endif
endfunction

map <leader>s :call ToggleScratch()<CR>

set grepprg=ack
set grepformat=%f:%l:%m
