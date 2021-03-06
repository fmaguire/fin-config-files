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

"<PERSISTENT UNDO>
set undodir=${HOME}/.vim/undo  " where to save undo histories
set undofile                 " Save undo's after file closes
set undolevels=10000         " How many undos
set undoreload=100000        " number of lines to save for undo

"<APPEARANCE>
set colorcolumn=80
set cmdheight=2
set laststatus=2
set number
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%] "useful statusline 
set background=dark
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
colorscheme delek "Colorscheme 

"<CTRLP>
set runtimepath^=~/.vim/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'ctrlp'
let g:ctrl_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$', 'link': 'some_bad_symbolic_links'}

let g:ctrlp_user_command = 'find %s -type f'

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


