"------ General ------
"
"highlight search patten
set hlsearch
"status bar
set laststatus=2
set statusline=%m[%l/%L,%p%%,%v]\ File:\ %<%f\%r%h%w\ [%{&ff},%{&fileencoding},%Y]

"jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"
"------ End General ------
