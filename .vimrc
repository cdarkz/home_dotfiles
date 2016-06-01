"------ Vundle ------
"
set nocompatible	"not compatible with the old-fashion vi mode
filetype off		"required!

"http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
"Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

"let Vundle manage Vundle
"required!
Plugin 'gmarik/vundle'

"my bundles
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
"Plugin 'brookhong/cscope.vim'
"Plugin 'hallison/vim-markdown'
Plugin 'ctrlpvim/ctrlp.vim'

" -- tagbar
let g:tagbar_width = 25
nmap tt		:TagbarToggle<CR>

" -- NERDTree
let NERDTreeWinPos = "left"
let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 20
nmap <F9>	<ESC>:NERDTreeToggle<RETURN>

" -- ctrlp.vim
let g:ctrlp_max_files = 100000

" All of your Plugins must be added before the following line
call vundle#end()
"
"------ End Vundle ------

"------ General ------
"
filetype plugin indent on	"enable filetype-specific plugins
filetype plugin on		"enable loading the plugin files for specific file types
syntax on			"enable syntax highlighting
set hlsearch			"highlight search patten
set cursorline			"highlight current line
set showcmd			"show command
"set mouse=a			"enable mouse mode

"bash like keys
cnoremap <C-A>	<Home>
cnoremap <C-E>	<End>

"jump splits
nmap <C-left>	<C-w>h
nmap <C-down>	<C-w>j
nmap <C-up>	<C-w>k
nmap <C-right>	<C-w>l

"status bar
set laststatus=2
set statusline=%m[%l/%L,%p%%,%v]\ File:\ %<%f\%r%h%w\ [%{&ff},%{&fileencoding},%Y]

"jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"
"------ End General ------
