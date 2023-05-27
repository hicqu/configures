source ~/.config/nvim/plugins.vim
source ~/.config/nvim/basic.vim

let mapleader=","
nnoremap <leader>f :CtrlSF<CR><C-w><C-w>
map <C-l> :e!<CR>

lua require("lsp")
