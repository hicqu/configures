require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = false,
})

local coq = require ("coq")
require("lspconfig")["jedi_language_server"].setup(coq.lsp_ensure_capabilities({}))
require('lspconfig')["gopls"].setup(coq.lsp_ensure_capabilities({}))

vim.diagnostic.config({
    virtual_text = false, signs = false, underline = false,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
      local opts = { buffer = args.buf }
      vim.bo[opts.buffer].omnifunc = "v:lua.vim.lsp.omnifunc"
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
      print("Lsp attached")
  end,
})
