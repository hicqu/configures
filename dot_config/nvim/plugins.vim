call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'dyng/ctrlsf.vim'

Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Plug 'ms-jpq/coq_nvim', { 'branch': 'coq' }
" Plug 'ms-jpq/coq.artifacts', { 'branch': 'artifacts' }

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
call plug#end()
