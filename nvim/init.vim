" Disable forced vi backwards compatibility
set nocompatible

" Disable modeline for better security
set nomodeline

" I don't need backups
set nobackup

" Per-OS changes
if has('win32')
	" Default location of config
	let g:VIM_CONFIG_HOME='~/vimfiles'
	" Set unnamed register to system clipboard
	set clipboard=unnamed
else
	if has('nvim')
		" configuration file location
		let g:VIM_CONFIG_HOME=$HOME.'/.config/nvim'
		" swap file location
		execute 'set directory='.$HOME.'/.local/share/nvim/swap//'
		call mkdir(&directory, 'p', 0700)
		" undo file location
		if has('persistent_undo')
			execute 'set undodir='.$HOME.'/.local/share/nvim/undo//'
			call mkdir(&undodir, 'p', 0700)
			set undofile
		endif
	else
		" configuration file location
		let g:VIM_CONFIG_HOME=$HOME.'/.vim'
		" swap file location
		execute 'set directory='.$HOME.'/.local/share/vim/swap//'
		call mkdir(&directory, 'p', 0700)
		" undo file location
		if has('persistent_undo')
			execute 'set undodir='.$HOME.'/.local/share/vim/undo//'
			call mkdir(&undodir, 'p', 0700)
			set undofile
		endif
	endif
	" Use X11's CLIPBOARD selection (Ctrl+{c,v})
	if has('clipboard') && ($DISPLAY != '')
		set clipboard+=unnamedplus
	endif
endif

" Look for a readable instance of Vim-Plug
if !empty(glob(g:VIM_CONFIG_HOME . '/autoload/plug.vim'))
	call plug#begin(g:VIM_CONFIG_HOME . '/plugged')
		Plug 'AndrewRadev/splitjoin.vim'                  " Switch between multi- and single-line statements
		Plug 'PProvost/vim-ps1'                           " Syntax for powershell scripts ( . ps1)
		Plug 'amirh/HTML-AutoCloseTag', { 'for': 'html' } " Auto close html tags
		Plug 'cespare/vim-toml'                           " Syntax for TOML
		Plug 'junegunn/vim-easy-align'                    " Easy column-based alignment
		Plug 'neomake/neomake.git' " Asynchronous :make and lint framework
		Plug 'rust-lang/rust.vim'                         " Configuration for Rust
		Plug 'tpope/vim-commentary'                       " Comment and uncomment easily
		Plug 'tpope/vim-repeat'                           " `.` support for plugins
		Plug 'tpope/vim-surround'                         " Quoting and parenthesizing
	call plug#end()
endif

" Character encoding
set encoding=utf-8

" Allow backspacing over autoindent, line breaks, start of insert action
set backspace=indent,eol,start

" Always show the ruler
set ruler

" Show quickfix window
au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow

" No bells
set visualbell
set noerrorbells
set visualbell t_vb =

" Get out of insert mode faster
set notimeout
set ttimeout
set ttimeoutlen=50 " Key code delay

" Indentation settings
set tabstop=4             " Tabs stop at multiples of this column number
set shiftwidth=4          " Number of spaces to use for each step of indentation
"set softtabstop=4         " Number of spaces a tab counts for when editing
filetype indent plugin on " Attempt to indent by filetype
set autoindent            " Default to same indent as current line

" Searching
set nohls      " Disable highlighting
set ignorecase " No case sensitivity when searching
set smartcase  " Case sensitive only when there is a captial letter in search
set incsearch  " Incrementally search while typing
set wrapscan   " Wrap to beginning of file if end is reached while searching
" Highlight matching {[(
set            showmatch

" Splitting
set splitright " Horizontal split will go right
set splitbelow " Vertical split will go below

" Set title to the name of the file
"" Reset the title to the buffer's full path every time a buffer is entered
auto BufEnter * :set title | let &titlestring = expand('%:p')

"" Switch buffers without requiring that buffers be saved
set hidden

" show line numbers
set number
