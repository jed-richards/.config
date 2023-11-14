local lspconfig = require("lspconfig")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function (client, bufnr)
    local map = function(mode, lhs, rhs, desc)
        local opts = {buffer = bufnr, remap = false, desc = desc}
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    map("n", "K", function() vim.lsp.buf.hover() end, "Hover info")
    map("n", "gd", ":Telescope lsp_definitions<CR>", "[G]o to [d]efinition")
    map("n", "gD", function() vim.lsp.buf.declaration() end, "[G]o to [D]eclaration")
    map("n", "gi", ":Telescope lsp_implementations<CR>", "[G]o to [i]mplementation")
    map("n", "gr", ":Telescope lsp_references<CR>", "[G]et [R]eferences")
    map("n", "<leader>vh", function() vim.lsp.buf.signature_help() end, "[V]iew signature [H]elp")
    map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, "Rename under cursor")
    map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, "[V]iew [C]ode [A]ctions")
    map("n", "<leader>vd", function() vim.diagnostic.open_float() end, "[V]iew [D]iagnostics")
    map("n", "[d", function() vim.diagnostic.goto_prev() end, "Prev Diagnostic")
    map("n", "]d", function() vim.diagnostic.goto_prev() end, "Next Diagnostic")
    map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, "View Workspace")
end

local default_config = {
    capabilities = lsp_capabilities,
    on_attach = on_attach,
}

local function is_empty(table_)
    -- return true if table is empty
    -- return false if table not empty
    for _, _ in pairs(table_) do
        return false
    end
    return true
end

local servers = require("jed-richards.configs.lsp.servers")

for server, config in pairs(servers) do
    if is_empty(config) then
        config = default_config
    end

    -- add on_attach if config doesn't have
    if not config.on_attach then
        config.on_attach = on_attach
    end

    -- add capabilities if config doesn't have
    if not config.capabilities then
        config.capabilities = lsp_capabilities
    end

    lspconfig[server].setup(config)
end
