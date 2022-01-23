"nvim configuration (using Vimscript)
"
" Use the .vimrc for nvim [https://neovim.io/doc/user/nvim.html#nvim-from-vim]
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"Remap terminal-normal mode to Esc
:tnoremap <Esc> <C-\><C-n>

