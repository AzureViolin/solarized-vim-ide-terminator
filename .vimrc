" --- Gotta be first ---
set nocompatible

" --- set clipboard to XA_PRIMARY
set clipboard=unnamed

" --- 2 space tab ---
" The width of a hard tabstop measured in "spaces" -- effectively the (maximum) width of an actual tab character.
set tabstop=4
" The size of an 'indent'. It's also measured in spaces, so if your code base indents with tab characters then you want shiftwidth to equal the number of tab characters times tabstop. This is also used by things like the =, > and < commands.
set shiftwidth=2
" Setting this to a non-zero value other than tabstop will make the tab key (in insert mode) insert a combination of spaces (and possibly tabs) to simulate tab stops at this width.
set softtabstop=0
" Enabling this will make the tab key (in insert mode) insert spaces or tabs to go to the next indent of the next tabstop when the cursor is at the beginning of a line (i.e. the only preceding characters are whitespace).
set smarttab
" Enabling this will make the tab key (in insert mode) insert spaces instead of tab characters. This also affects the behavior of the retab command.
set expandtab
" To turn off expandtab for editing makefiles
autocmd FileType make setlocal noexpandtab

" --- vundle plugin manager ---
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" --- Making Vim look good ---
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'tomasr/molokai'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

" --- Vim as a programmer's text editor ---
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'
" --- syntax highlight ---
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
" --- auto completion ---
Plugin  'Valloric/YouCompleteMe'

" Highlight and trip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
Plugin 'godlygeek/tabular'
" remaps . in a way that plugins can tap into it
Plugin  'tpope/vim-repeat'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number relativenumber
set showcmd
set incsearch
set hlsearch

syntax on

" --- highlight uncommon extensions ---
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.srdf set filetype=xml
au BufNewFile,BufRead *.urdf set filetype=xml
au BufNewFile,BufRead *.URDF set filetype=xml
au BufNewFile,BufRead *.rviz set filetype=yaml
au BufNewFile,BufRead *.ino set filetype=cpp

" --- enable mouse ---
set mouse=a

" --- Plugin-Specific Settings ---
" --- YouCompleteMe ---
"let mapleader = "\<Space>"

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
" --- altercation/vim-color-solarized settings ---
"  Toggle this to "light" for light colorscheme
set background=dark

" Set the colorscheme
" Should set colo to solarized even in terminator
set t_Co=256
colorscheme solarized

" --- vim-airline/vim-airline settings ---
"  Always show statusbar
set laststatus=2

" Enable Fancy Powerline font:Menlo-for-Powerline
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_past=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" --- jistr/vim-nerdtree-tabs ---
"  Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
"let g:nerdtree_tabs_open_on_console_startup = 1
nmap <F2> :NERDTreeTabsToggle<CR>

" --- scrooloose/syntastic settings ---
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = '▲'
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup END

" --- xolox/vim-easytags settings ---
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" --- majutsushi/tagbar settings ---
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"let g:tagbar_width=35
"let g:tagbar_autofocus=1
"let g:tagbar_left = 1
nmap <F3> :TagbarToggle<CR>

" --- airblade/vim-gitgutter settings ---
"  Reqruied after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
let g:gitgutter_max_signs = 1000 "default 500

" --- Raimondi/delimitMate settings ---
let delimitMate_expand_cr = 1
augroup mydelimitMate
	au!
	au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
	au FileType tex let b:delimitMate_quotes = ""
	au FileType tex let b:delimitMate_matchpairs = "(:),[:],{,},`:'"
	au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --- jez/vim-superman settings ---
"  better man page supoprt
noremap K :SuperMan <cword><CR>
