require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "rust_analyzer", "tsserver", "pyright", "lua_ls", "clangd", "cmake" },
})

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

end

require("lspconfig").pyright.setup({ on_attach = on_attach })
require("lspconfig").tsserver.setup({ on_attach = on_attach })
require("lspconfig").rust_analyzer.setup({ on_attach = on_attach })
require("lspconfig").clangd.setup({ on_attach = on_attach })
require("lspconfig").cmake.setup({ on_attach = on_attach })
require("lspconfig").lua_ls.setup({ on_attach = on_attach, settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
