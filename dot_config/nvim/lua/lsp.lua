require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = false,
})

require("lspconfig")["jedi_language_server"].setup({})
require("lspconfig")["lua_ls"].setup({})
require("lspconfig")["gopls"].setup({})

vim.diagnostic.config({
	virtual_text = false, signs = false, underline = false,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.bo[opts.buffer].omnifunc = "v:lua.vim.lsp.omnifunc"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format({ async = true }) end, opts)

		print("Lsp attached")
	end,
})

local cmp = require("cmp")
local compare = require("cmp.config.compare")
local types_cmp = require("cmp.types.cmp")
local types_lsp = require("cmp.types.lsp")
cmp.setup({
	enabled = function()
		local context = require "cmp.config.context"
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	completion = {
		completeopt = "menu,menuone,noselect",
	},
	preselect = types_cmp.PreselectMode.None,
	sorting = {
		comparators = { compare.exact, compare.kind, compare.sort_text },
	},
	matching = {
		disallow_fuzzy_matching = true,
		disallow_fullfuzzy_matching = true,
		disallow_partial_fuzzy_matching = true,
		disallow_prefix_unmatching = true,
	},
	view = {
		entries = "custom",
	},
	window = {
		completion = {
			scrollbar = false,
		}
	},
	formatting = {
		fields = { 'abbr', 'kind', 'menu' },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
		{
			name = "nvim_lsp",
			entry_filter = function(entry, ctx)
				return not string.find(entry:get_completion_item().label, "%.")
			end,
		},
		{ name = "vsnip" },
	})
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig")["jedi_language_server"].setup({ capabilities = capabilities })
require("lspconfig")["lua_ls"].setup({ capabilities = capabilities })
require("lspconfig")["gopls"].setup({ capabilities = capabilities })
