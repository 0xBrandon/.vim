
"""""""""""""""""""""
" LAUNCH CONFIG
"""""""""""""""""""""
execute pathogen#infect()
call pathogen#helptags()

set encoding=utf-8      " set default encoding to UTF-8
set nocompatible        " vim is not vi compatible
set autochdir           " use the current file's dir as the working dir

filetype off            " turn off filetype detection
filetype indent on      " load filetype-specific indent files
                        " also turns on filetype detection

" A shortcut to source .vimrc
nnoremap <leader>b :source $MYVIMRC<CR>

"""""""""""""""""""""
" Font
"""""""""""""""""""""
set guifont=Fira\ Code:h14  " MacOS
"set guifont=Monaco\ 14     " Other flavors of Linux

"""""""""""""""""""""
" LEADER SHORTCUTS
"""""""""""""""""""""
let mapleader=","       " leader is comma
let g:mapleader=","

"""""""""""""""""""""
" COLORS
"""""""""""""""""""""
set t_Co=256            " set terminal to terminal to 256color mode
syntax enable           " enable syntax processing
set background=dark     " dark background
colorscheme gruvbox     " coloscheme

"""""""""""""""""""""
" SPACES & TABS & LINES
"""""""""""""""""""""
"set autoindent         " copy the indentation from the previous line
"set smarttab           " smart handling of the tab key
set expandtab           " tabs are spaces
set tabstop=4           " number of visual spaces per TAB reading files
set softtabstop=4       " number of spaces used for tab when editing
set shiftwidth=4

" Toggle paste mode to prevent or allow auto indenting when pasting
set pastetoggle=<leader>p

" Handle long lines
" set nowrap
set textwidth=80
set formatoptions=qrn1

" highlight anything over the 81 column length in red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" set 80 character line limit
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"""""""""""""""""""""
" UI CONFIG
"""""""""""""""""""""
set noerrorbells        " No bells
set number              " show line numbers
set relativenumber      " use relative numbers rather than absolute
set showcmd             " show command in bottom bar
set showmode            " show current mode
set splitright          " Split vertical windows to the right
set splitbelow          " Split horizontal windows below
set laststatus=2        " Always display the status line
set hidden              " opening a new file when the current buffer has
                        " unsaved changes causes files to be hidden not closed
set ruler               " show the current position
set ttyfast             " Fast terminal connection, improves performance
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
set cursorline          " highlight current line
set history=700         " Sets how many lines of history VIM has to remember

" toggle spell checking
map <leader>ss :setlocal spell!<cr>

""""""""""""""""""""
" STATUS LINE (Not using)
"""""""""""""""""""""
" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" EXAMPLE status line tags
" set statusline=%t                                 "tail of the filename
" set statusline+=[%{strlen(&fenc)?&fenc:'none'},   "file encoding
" set statusline+=%{&ff}]                           "file format
" set statusline+=%h                                "help file flag
" set statusline+=%m                                "modified flag
" set statusline+=%r                                "read only flag
" set statusline+=%y                                "filetype
" set statusline+=%=                                "left/right separator
" set statusline+=%c,                               "cursor column
" set statusline+=%l/%L                             "cursor line/total lines
" set statusline+=\ %P                              "percent through file

""""""""""""""""""""
" WILDMENU SETTINGS
"""""""""""""""""""""
set wildmenu            " visual autocomplete for command menu
set wildmode=list:full  " set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.orig                           " Merge resolution files

"""""""""""""""""""""
" SEARCHING
"""""""""""""""""""""
set incsearch           " Show matches while typing
set hlsearch            " Highlight matches
set ignorecase          " Ignore case while searching
set smartcase           " Use case in search patterns

" set complete-=i       " Tell autocomplete where to look
" set complete=.,w,b,u,t

" leader followed by space will turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"""""""""""""""""""""
" FOLDING (Not using)
"""""""""""""""""""""
" set foldenable          " enable folding
" set foldlevelstart=10   " open most folds by default
" set foldnestmax=10      " 10 nested fold max
" space open/closes folds
" nnoremap <space> za
" set foldmethod=indent   " fold based on indent level

"""""""""""""""""""""
" MOVEMENT
"""""""""""""""""""""
" move vertically by visual line
map <Up> gk
map <Down> gj

" Move arounds line visually, don't skip over wrapped lines
" nnoremap j gj
" nnoremap k gk

" Move by virtual lines when used without a count
" Move by physical lines when used with a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" highlight last inserted text
" nnoremap gV `[v`]

""""""""""""""""""""
" AUTOGROUPS
"""""""""""""""""""""
" language-specific settings
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.py,*.js,*.java,*.html,*.css,*.json,*.c,*.cpp :call TrimEndLines()
augroup END

""""""""""""""""""""
" BACKUPS
"""""""""""""""""""""
" Autosave
au FocusLost * :wa     " Automatically autosave when out of focus
set autowrite          " Automatically save
set autoread           " Automatically reread changed files

" But don't create backups
set noswapfile          " Don't use swapfile
set nobackup            " Don't create backups
set nowritebackup       " Don't write backups

" Don't save .netrwhist history
let g:netrw_dirhistmax=0

""""""""""""""""""""
" FILE TYPE SETTINGS
"""""""""""""""""""""
au BufNewFile,BufRead *.java setlocal expandtab sw=2 sts=2
au BufNewFile,BufRead *.rs setlocal expandtab sw=2 sts=2
au BufNewFile,BufRead *.html setlocal expandtab sw=2 sts=2
au BufNewFile,BufRead *.css setlocal expandtab sw=2 sts=2
au BufNewFile,BufRead *.js setlocal expandtab sw=2 sts=2
au BufNewFile,BufRead *.cpp setlocal expandtab sw=2 sts=2
au BufNewFile,BufRead *.c setlocal expandtab sw=2 sts=2
au BufNewFile,BufRead *.json setlocal expandtab sw=2 sts=2
au BufNewFile,BufRead *.vim setlocal expandtab sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal expandtab spell sw=2 sts=2
au BufNewFile,BufRead *.yml setlocal expandtab spell sw=2 sts=2
au BufNewFile,BufRead *.md setlocal expandtab spell sw=2 sts=2
au BufNewFile,BufRead *.py setlocal expandtab spell sw=2 sts=2
au BufNewFile,BufRead *.ex setlocal expandtab spell sw=2 sts=2

""""""""""""""""""""
" CUSTOM FUNCTIONS
"""""""""""""""""""""
" Strips trailing whitespace at the end of files
" This function is called on buffer write in the autogroup above
fun! StripWhitespaces()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//
    call winrestview(l:save)
endfun

" toggle between number and relative number
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" This function will trim blank lines at the end of files
" This function is called on buffer write in the autogroup above
fun! TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfun

" bind ToggleNumber function
nnoremap <leader>n :call ToggleNumber()<CR>

" bind StripWhitespaces() function
nnoremap <leader>w :call StripWhitespaces()<CR>

" bind TrimEndLines() function
nnoremap <leader>s :call TrimEndLines()<CR>

"""""""""""""""""""""
" Addon Settings
"""""""""""""""""""""
" Below are configuration setings for addons

"""""""""""""""""""""
" UNDOTREE
"""""""""""""""""""""
nnoremap <leader>u :UndotreeToggle<CR>

"""""""""""""""""""""
" NERDTree
"""""""""""""""""""""
nnoremap <leader>t :NERDTreeToggle<CR>

"""""""""""""""""""""
" EMMET
"""""""""""""""""""""
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"""""""""""""""""""""
" Airline
"""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
