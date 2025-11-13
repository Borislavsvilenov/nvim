local lspconfig = require("lspconfig")
local LspAttach = require("lsp").LspAttach

local servers = {'clangd', 'lua_ls', 'pyright', 'cmake', 'jdtls'}

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = LspAttach,
    })
end
