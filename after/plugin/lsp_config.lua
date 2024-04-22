require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "rust_analyzer", "tsserver", "pyright", "lua_ls", "clangd", "cmake" },
})
