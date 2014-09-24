"<GENERAL>
set nocompatible "Use more than just vi features on init

"<FILE SETTINGS>
filetype plugin on "filetype plugins
filetype indent on "filetype plugins 
set history=1000 "store 1000 lines of history
set autoread "autoread on file change from outside
set ffs=unix,dos,mac  "filetype preference to Unix  
set encoding=utf-8 "character encoding

"<FORMATTING>
set tabstop=4 shiftwidth=4 "tab=4 spaces 
set expandtab "spaces instead of tabs
set ai "Auto indent
set si "Smart indent
set wrap "Wrap linesi

"<SEARCH>
set hlsearch "hilight search results 
set incsearch "incremental searchh
set ignorecase "ignore case when searching
set smartcase

"<LANGUAGE RELATED>
syntax enable "syntax hilighting
set showcmd

"<APPEARANCE>
set cmdheight=2
set laststatus=2
set number
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%] "useful statusline 
set background=dark
colorscheme blackboard "Colorscheme 

"<BUFFERS>
autocmd BufReadPost *                                        "Return to last edit position when opening files 
     \ if line("'\"") > 0 && line("'\"") <= line("$") |      
     \   exe "normal! g`\"" |                               
     \ endif                                               
set viminfo^=%                                               "Remember info about open buffers on close 


"<CUSTOM>
set backspace=eol,start,indent                               "fix backspace 
set whichwrap+=<,>,h,l                                       "fix backspacei 
inoremap jj <Esc>

""remap jj as escape  
func! DeleteTrailingWS()                                     "removes trailings escape whitespace in python or coffee scripts 
      exe "normal mz"
        %s/\s\+$//ge
          exe "normal `z"
      endfunc
      autocmd BufWrite *.py :call DeleteTrailingWS()
      autocmd BufWrite *.coffee :call DeleteTrailingWS()

autocmd FileType python compiler pylint

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
