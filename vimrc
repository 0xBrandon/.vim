""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configuration
" Maintainer: Brandon Hill
" Last Updated: 12-01-2024
"
" Sections:
" -> Initial Setup
" -> Plugin Management
" -> Plugin Configuration
" -> Core Vim Settings
" -> UI and Colors
" -> Editor Behavior
" -> Key Mappings
" -> Custom Functions
" -> Auto Commands
" -> FileType Settings

" Required external dependencies:
" - Node.js (for CoC)
" - ripgrep (for FZF)
" - Various language servers for CoC extensions
" - git (for various plugins)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Initial Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                   " Vim not vi
set encoding=utf-8                 " UTF-8 encoding
let mapleader = ","                " Set leader key

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Core Functionality
Plug 'tpope/vim-fugitive'                " Git integration
Plug 'airblade/vim-gitgutter'            " Git changes in gutter
Plug 'preservim/nerdtree'                " File explorer
Plug 'mbbill/undotree'                   " Undo visualization
Plug 'vim-airline/vim-airline'           " Status line
Plug 'dense-analysis/ale'                " Async linting engine
Plug 'jiangmiao/auto-pairs'              " Auto pair brackets
Plug 'tpope/vim-surround'                " Surround text objects
Plug 'tpope/vim-commentary'              " Easy commenting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language Support
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Completion engine
Plug 'vim-python/python-syntax'          " Python syntax
Plug 'Vimjas/vim-python-pep8-indent'     " Python indentation
Plug 'rust-lang/rust.vim'                " Rust support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  " Go support
Plug 'buoto/gotests-vim'                 " Go test generation
Plug 'octol/vim-cpp-enhanced-highlight'  " C++ highlighting
Plug 'vim-scripts/a.vim'                 " Header/source switching
Plug 'elixir-editors/vim-elixir'         " Elixir support

" Web Development
Plug 'mattn/emmet-vim'                   " HTML/CSS toolkit
Plug 'pangloss/vim-javascript'           " JavaScript support
Plug 'maxmellon/vim-jsx-pretty'          " JSX support
Plug 'leafgarland/typescript-vim'        " TypeScript support
Plug 'ap/vim-css-color'                  " Color previews

" Data Formats
Plug 'elzr/vim-json'                     " JSON support
Plug 'cespare/vim-toml'                  " TOML support
Plug 'plasticboy/vim-markdown'           " Markdown support
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Snippets
Plug 'honza/vim-snippets'                " Snippet collection

" Themes
Plug 'sainnhe/gruvbox-material'          " Modern gruvbox
Plug 'shaunsingh/nord.nvim'              " Enhanced Nord
Plug 'rakr/vim-one'                      " One Dark/Light
Plug 'Mofiqul/dracula.nvim'              " Enhanced Dracula
Plug 'lifepillar/vim-solarized8'         " Modern Solarized
Plug 'tomasr/molokai'                    " Molokai
Plug 'challenger-deep-theme/vim'         " Challenger Deep
Plug 'bluz71/vim-nightfly-guicolors'     " Nightfly
Plug 'ayu-theme/ayu-vim'                 " Ayu
Plug 'sainnhe/edge'                      " Edge
Plug 'cocopon/iceberg.vim'               " Iceberg

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- Theme Configuration ---
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_better_performance = 1
let ayucolor="dark"
let g:one_allow_italics = 1

" Terminal color support
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" --- ALE Configuration ---
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint'],
\   'go': ['gopls'],
\   'rust': ['analyzer'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'rust': ['rustfmt'],
\   'go': ['gofmt', 'goimports'],
\}

let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" --- CoC Configuration ---
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-git',
    \ 'coc-pyright',
    \ 'coc-rust-analyzer',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-prettier',
    \ 'coc-go',
    \ ]

" --- vim-go Configuration ---
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_addtags_transform = "camelcase"
let g:go_auto_sameids = 1

" --- FZF Configuration ---
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }

" --- NERDTree Configuration ---
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']

" --- Emmet Configuration ---
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" --- Airline Configuration ---
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_highlighting_cache = 1
let g:airline_extensions = ['branch', 'tabline']
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_section_b = '%{getcwd()}'
let g:airline_section_y = '%{&fileencoding}'

let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ }

" --- Undotree Configuration ---
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Core Vim Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- General ---
filetype plugin indent on           " Enable file type detection
set hidden                          " Allow hidden buffers
set autoread                        " Auto reload changed files
set autochdir                       " Auto change directory to file location
set history=700                     " Command history
set updatetime=300                  " Faster completion
set timeoutlen=500                  " Faster key sequence completion

" --- Backup and Swap Files ---
set noswapfile                      " No swap file
set nobackup                        " No backup file
set nowritebackup                   " No backup while editing
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undo
endif

" --- Search Settings ---
set incsearch                       " Show matches while typing
set hlsearch                        " Highlight matches
set ignorecase                      " Ignore case while searching
set smartcase                       " Use case if any caps used
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI and Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- Visual Settings ---
set number                          " Show line numbers
set relativenumber                  " Relative line numbers
set showcmd                         " Show command in bottom bar
set showmode                        " Show current mode
set showmatch                       " Highlight matching brackets
set cursorline                      " Highlight current line
set noerrorbells                    " No bells
set signcolumn=yes                  " Always show sign column
set laststatus=2                    " Always show status line
set ruler                           " Show cursor position

" --- Colors and Fonts ---
syntax enable                       " Enable syntax processing
set background=dark                 " Dark background
set t_Co=256                        " 256 color terminal
colorscheme gruvbox-material        " Set colorscheme

" --- GUI Settings ---
if has('gui_running')
    set guifont=JetBrains\ Mono:h14 " GUI font
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor Behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- Tabs and Indentation ---
set expandtab                       " Use spaces instead of tabs
set tabstop=4                       " Visual spaces per tab
set softtabstop=4                   " Spaces in tab when editing
set shiftwidth=4                    " Auto indent spaces
set splitright                      " Split vertical windows right
set splitbelow                      " Split horizontal windows below

" --- Text Display ---
set textwidth=80                    " Line wrap at 80 chars
set formatoptions=qrn1
set colorcolumn=80                  " Highlight column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" --- Completion ---
set wildmenu                        " Visual command-line completion
set wildmode=list:full             " Command completion mode
set shortmess+=c                    " Don't pass messages to completion menu

" --- Wild Ignore Patterns ---
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.sw?
set wildignore+=*.orig

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- General Mappings ---
nnoremap <leader>b :source $MYVIMRC<CR>
map <leader>ss :setlocal spell!<cr>
nnoremap <leader><space> :nohlsearch<CR>

" --- Plugin Mappings ---
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>g :Rg<CR>

" --- Window Navigation ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- Movement ---
map <Up> gk
map <Down> gj
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" --- CoC Mappings ---
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle between number and relative number
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Strip trailing whitespace
function! StripWhitespaces()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//
    call winrestview(l:save)
endfunction

" Trim blank lines at end of file
function! TrimEndLines()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" CoC check backspace for completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" CoC show documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Function key bindings
nnoremap <leader>n :call ToggleNumber()<CR>
nnoremap <leader>w :call StripWhitespaces()<CR>
nnoremap <leader>s :call TrimEndLines()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General auto commands
augroup configgroup
    autocmd!
    " Clear sign column highlight
    autocmd VimEnter * highlight clear SignColumn

    " Trim whitespace and blank lines on save for specific file types
    autocmd BufWritePre *.py,*.js,*.java,*.html,*.css,*.json,*.c,*.cpp,*.rs,*.ex,*.vim,*.txt,*.yml,*.md,*.go :call TrimEndLines()

    " Auto save on focus lost
    autocmd FocusLost * :wa
augroup END

" NERDTree auto commands
augroup nerdtree_group
    autocmd!
    " Close vim if NERDTree is the only window remaining
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " Open NERDTree automatically when vim starts up on opening a directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
        \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
augroup END

" Emmet auto commands
augroup emmet_group
    autocmd!
    autocmd FileType html,css EmmetInstall
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FileType Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup FileTypeSpecific
    autocmd!
    " Web development (2 spaces)
    autocmd FileType java,javascript,html,css,json,vim,rust,c,cpp
        \ setlocal expandtab shiftwidth=2 softtabstop=2

    " Python (4 spaces - PEP8)
    autocmd FileType python
        \ setlocal expandtab shiftwidth=4 softtabstop=4

    " Go (tabs - Go standard)
    autocmd FileType go
        \ setlocal noexpandtab tabstop=4 shiftwidth=4

    " Documentation files (2 spaces with spell check)
    autocmd FileType markdown,yaml
        \ setlocal expandtab shiftwidth=2 softtabstop=2 spell
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End of Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
