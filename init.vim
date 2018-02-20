""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" PACKAGE MANAGEMENT
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" be iMproved, required.
set nocompatible
" turn off filetype detection, required.
filetype off

" set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required.
Plugin 'VundleVim/Vundle.vim'

" core plugins.
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'
Plugin 'kien/ctrlp.vim'

" main plugins.
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'

" ui/panel plugins.
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

" language plugins.
Plugin 'fatih/vim-go'

" autocomplete, snippets and formatting.
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'AndrewRadev/splitjoin.vim'

" end the vundle loader and enable filetype detection again.
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" define how and where backups are stored.
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backup
set writebackup
set noswapfile

" persist undo tree between sessions
set undofile
set history=100
set undolevels=100

" ignore certain files and folders.
set wildignore+=*/.git/*,*/node_modules/*,*/vendor/*,*/bin/*,*/obj/*

" set <leader>.
let mapleader=','

" show trailing whitespaces.
set list
set listchars=nbsp:⦸,tab:\ \ ,extends:»,precedes:«,trail:•

" enable syntax highlighting and set a color scheme.
syntax on
let base16colorspace = 256
colorscheme base16-tomorrow-night

" configure ctrlp.
let g:ctrlp_map = '<c-p>'
nnoremap <leader>p :CtrlPBuffer<CR>

" enable and configure airline.
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0

" configure fugitive shortcuts.
nnoremap <leader>s :Gstatus<CR>

" use the system clipboard by default.
set clipboard=unnamedplus

" toggle paste mode.
set pastetoggle=<leader>p

" show/hide toggleables.
nnoremap <F1> :TagbarToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>

" highlight the current line.
set cursorline

" show line numbers
set number

" make buffers hidden when they're abandoned.
set hidden

" don't wrap long lines automatically.
set nowrap

" allow backspacing over everytrhing in insert mode.
set backspace=indent,eol,start

" set tab sizes and indenting.
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" insert tabs on the start of the line according to shiftwidth, not tabstop.
set smarttab

" case insensitive search, and highlight search terms.
set ignorecase
set smartcase
set hlsearch
set incsearch

" case insensitive completion of filenames.
set wildignorecase

" disable highlighting.
map <silent> <leader><CR> :noh<CR>

" auto-highlight matching parenthesis and other block indicators.
set showmatch

" simplify moving between open windows.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" switch cwd to the directory of the open buffer.
nmap <silent> <leader>cd :lcd %:h<CR>

" create the full directory tree to the open buffer.
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" change terminal title.
set title

" don't beep.
set visualbell
set noerrorbells

" quickfix navigation.
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" configure UltiSnips keybindings.
let g:UltiSnipsExpandTrigger = '<C-j>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" GO LANGUAGE SETTINGS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:go_fmt_command = 'goimports'
let g:go_list_type = 'quickfix'
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_addtags_transform = 'camelcase'
let g:go_def_mode = 'guru'

augroup FileType go
	au!
	autocmd FileType go command! -bang GoAlternateVerticalSplit call go#alternate#Switch(<bang>0, 'vsplit')
	au FileType go nmap <leader>gd <Plug>(go-def-vertical)
	au FileType go nmap <leader>ga :GoAlternateVerticalSplit<CR>
	au FileType go nmap <leader>i <Plug>(go-info)
	au FileType go nmap <leader>b <Plug>(go-build)
	au FileType go nmap <leader>t <Plug>(go-test)
	au FileType go nmap <leader>tf <Plug>(go-test-func)
	au FileType go nmap <leader>l <Plug>(go-metalinter)
augroup end
