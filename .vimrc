runtime! debian.vim
set nocompatible                          " be iMproved, required
filetype off                              " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		          " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	  " Project and file navigation
Plugin 'majutsushi/tagbar'          	  " Class/module browser

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'                " Lean & mean status/tabline for vim
"Plugin 'fisadev/FixedTaskList.vim'        " Pending tasks list
"Plugin 'rosenfeld/conque-term'            " Consoles as buffers
Plugin 'tpope/vim-surround'               " Parentheses, brackets, quotes, XML tags, and more
"Plugin 'altercation/vim-colors-solarized' " Colorscheme
"Plugin 'tomasr/molokai'                   " still colorscheme
"Plugin 'sickill/vim-monokai'              " still colorscheme
"Plugin 'flazz/vim-colorschemes'          " still colorscheme
"Plugin 'ciaranm/inkpot'                   " still colorscheme
"Plugin 'sjl/badwolf'                      " still colorscheme
"Plugin 'duythinht/inori'                  " still colorscheme
"Plugin 'Lokaltog/vim-distinguished'      " still colorshceme
Plugin 'morhetz/gruvbox'                  " still colorscheme
Plugin 'djjcast/mirodark'                 " still colorscheme
"Plugin 'whatyouhide/vim-gotham'
Plugin 'godlygeek/tabular'              
"Plugin 'wting/rust.vim'                   " support rust syntax
Plugin 'mhinz/vim-startify'               " nice start screen
"Plugin 'tpope/vim-fugitive'               " for git
Plugin 'dhruvasagar/vim-table-mode'       " Paste tables
"Plugin 'artur-shaik/vim-javacomplete2'

"--------------=== Snippets support ===---------------
"Plugin 'garbas/vim-snipmate'		    " Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
"Plugin 'tomtom/tlib_vim'		        " dependencies #2
"Plugin 'honza/vim-snippets'		        " snippets repo

"---------------=== Languages support ===-------------
"---------------------=== Python ===------------------
Plugin 'klen/python-mode'                 " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'             " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'              " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'    " Combined Python 2/3 for Vim
"Plugin 'scrooloose/syntastic'             " Вывод ошибок
"Plugin 'pangloss/vim-javascript'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'Valloric/YouCompleteMe'


"----------Haskell--------
"Plugin 'raichoo/haskell-vim'              " support haskell syntax
"Plugin 'dag/vim2hs'                       "support haskell syntax
"Plugin 'enomsg/vim-haskellConcealPlus'    
"
"---------Scala-----------
"Plugin 'derekwyatt/vim-scala'  "syntax

call vundle#end()            		      " required
filetype on
filetype plugin on
filetype plugin indent on


"-------------==========----------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-------------=====NerdTree=====-----------------------
autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', '\.hi$', 'pip-log\.ztxt$', '\.o$', '\.jpg', '\.jpeg', '\.png', '\.gif', '\.pdf', '.djvu', '\.epub', '\.doc', '\.mkv', '\.mobi', '\.zip', '\.deb', '\.gz', '\.mp4', '\.mp3', '\.torrent', '\.db']

set background=dark
set backspace=indent,eol,start
"set regexpengine=1
set ruler
syntax enable
"set listchars=tab:--
"set list
set autoread
if has('gui_running')
	colorscheme solarized
else 
	let g:solarized_termcolors=256
        let g:molokai_original = 1
        let g:rehash256=1
    "colorscheme gotham
    "colorscheme gruvbox
    colorscheme mirodark
endif

set ttyfast
"===Default whitespace====
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

"===Wrapping text by default===
set wrap
set linebreak

set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=L
set guioptions-=T
set number
"set guifont=Liberation\ Mono\ for\ Powerline\ 13
set guifont=M+\ 1mn
set showcmd
"call togglebg#map("<F5>")
set encoding=utf8
set noswapfile
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.jpg
set pastetoggle=<f12>

"===Searching and highlights===
set incsearch
set hlsearch
set ignorecase
set smartcase

set scrolloff=3             "Запас на скроллинг
"set cursorline             "Подсвечивать текущую строку
set nobackup
set nowritebackup
set t_Co=256
set mouse=a
set showbreak=\\\\\\>       "Показывает перенесенные строки
set showmatch

"---------===Settings Vim-airline===-----------
set laststatus=2
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_enable_syntastic=1
let g:airline_symbols.space = "\ua0"
let g:airline_theme='lucius'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:bufferline_echo = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'

"----------====TagBar===---------------------
map <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии


" --------TaskList настройки-----------------
map <F2> :TaskList<CR>           " отобразить список тасков на F2


"--------------===raichoo/Vim-Haskell===--------------
let g:haskell_enable_quantification = 0
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_indent_if = 0
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 0
let g:cabal_indent_section = 2



"-------------=====Folding=====-----------------
set foldenable
set foldmethod=syntax
set foldcolumn=1
set foldlevel=3

"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
 " проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
 " провека кода после сохранения
let g:pymode_lint_write = 1

 " поддержка virtualenv
let g:pymode_virtualenv = 1

 " установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

 " подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"====Conque-term===
"
"if has("gui_running")
"    nnoremap <F6> :ConqueTermSplit bash<CR>
"    nnoremap <C-q> :bd<CR>
"    nnoremap <leader>Tp :set ft=python<CR>
"endif
" автокомплит через <Ctrl+Space>
inoremap <C-space> <C-x><C-o>


 " отключить autofold по коду
let g:pymode_folding = 0

 " возможность запускать код
let g:pymode_run = 0
" Disable choose first function/method at autocomplete
" let g:jedi#popup_select_first = 0
autocmd FileType python set completeopt-=preview " раскомментируйте, в
"случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 
                                \ formatoptions+=croq softtabstop=4 smartindent 
                                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 
                                \ softtabstop=4 smartindent 
                                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:jedi#force_py_version = 3
"-------===Haksell==Vim2Hs==-------------
if has("gui_running")
    let g:haskell_conceal_wide = 1
    let g:haskell_conceal = 1
    let g:haskell_conceal_enumerations = 1
else
    let g:haskell_conceal_wide = 0
    " disable all conceals, including the simple ones like
    " lambda and composition
    let g:haskell_conceal      = 1

    " disable concealing of "enumerations": commatized lists like
    " deriving clauses and LANGUAGE pragmas,
    " otherwise collapsed into a single ellipsis
    let g:haskell_conceal_enumerations = 1
endif
let g:haskell_quasi         = 1
let g:haskell_interpolation = 1
let g:haskell_regex         = 1
let g:haskell_jmacro        = 1
let g:haskell_shqq          = 1
let g:haskell_sql           = 1
let g:haskell_json          = 1
let g:haskell_xml           = 1
let g:haskell_hsp           = 1
let g:haskell_multiline_strings = 1
let g:haskell_tabular       = 0

"-------=====RussianMap====--------
set keymap=russian-jcukenwin
set iminsert=0

autocmd User Startified setlocal cursorline
autocmd VimEnter *
               \   if !argc()
               \ |   Startify
               \ |   NERDTree
               \ |   wincmd w
               \ | endif
let NERDTreeHijackNetrw = 0
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1
let g:startify_bookmarks = ['~/.vimrc', '~/.zshrc.pre', '~/.i3/config', '~/.urxvtc']
let g:startify_skiplist = ['vimrc','bashrc']

if &term =~ '^xterm'
    "solid underscore
    let &t_SI .= "\<Esc>[4 q"
    " solid block
    let &t_EI .= "\<Esc>[2 q"
    " 1 or 0 -> blinking block
    " 3 -> blinking underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
endif
"set guiheadroom=0
nmap <C-k> :! scheme --load %<CR>
nmap <C-h> :! ghci %<CR>
nmap <S-p> :! python3m %<CR>
nmap <C-p> :! python3m <CR>

"===Table-Mode===
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

set cm=blowfish
set wildmenu

"===YouCompleteMe===
let g:EclimCompletionMethod = 'omnifunc'
autocmd FileType java set omnifunc=javacomplete#Complete
nnoremap <F4> :JCimportAdd<cr>
inoremap <F4> <esc>:JCimportAddI<cr>
