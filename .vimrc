" --- Gotta be first ---
set nocompatible

" --- 4 space tab ---
set tabstop=4

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
set number
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
