require("mason").setup()
-- require("dap")
-- require("mason-nvim-dap").setup()
require("mason-null-ls").setup({
	ensure_installed = { "xmlformatter", "clang-format" },
	automatic_setup = true,
})
require("mason-null-ls").setup_handlers()
require("mason-lspconfig").setup()
require("null-ls").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("config/cmp_support").on_attach
local lsp_flags = require("config/cmp_support").lsp_flags

require('lspconfig')['lemminx'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}
