set nocompatible 
filetype plugin on
syntax on

" colorscheme set
colorscheme darkblue

" Calls a bash program 'wmctrl' to map the f11 key to make Vim fullscreen
map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" Virtual nav for soft wrapped lines
noremap j gj
noremap k gk

set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

" VimWiki
let g:vimwiki_list = [{'path': '~/Desktop/crontiki/'}]

set wrap
set linebreak
set nolist " list disable linebreak

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " ...
endif

