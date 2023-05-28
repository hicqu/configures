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

vim.g.completeopt = "menu"
vim.g.coq_settings = {
    ["completion.always"] = true,
    ["completion.smart"] = false,
    ["keymap.recommended"] = false,
    ["keymap.manual_complete"] = "<C-n>",
    ["keymap.pre_select"] = true,
}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
      local opts = { buffer = args.buf }
      vim.bo[opts.buffer].omnifunc = "v:lua.vim.lsp.omnifunc"
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)

      vim.keymap.set({'i', 'n', 'o'}, '<CR>', function()
	  if vim.fn.pumvisible() then
	      print("not cr")
	      if vim.fn.complete_info().selected == -1 then
		  return  "<C-e>" 
	      else
		  return "<C-y>"
	      end
	  else
	      print("not cr")
	    return 	      "<CR>"
	  end
      end, { expr = true })

      vim.cmd("COQnow --shut-up")
      print("Lsp attached & COQ started")
  end,
})
