require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function()
        local map = function(mode, lhs, rhs, desc)
            local opts = {buffer = bufnr, remap = false, desc = desc}
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        map("n", "K", function() vim.lsp.buf.hover() end, "Hover info")
        map("n", "gd", function() vim.lsp.buf.definition() end, "[G]o to [d]efinition")
        map("n", "gD", function() vim.lsp.buf.declaration() end, "[G]o to [D]eclaration")
        map("n", "gi", function() vim.lsp.buf.implementation() end, "[G]o to [i]mplementation")
        map("n", "gr", function() vim.lsp.buf.references() end, "[G]et [r]eferences")
        map("n", "gs", function() vim.lsp.buf.signature_help() end, "[G]et [s]ignature help")
        map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, "Rename under cursor")
        map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, "[V]iew [C]ode [A]ctions")
        map("n", "<leader>vd", function() vim.diagnostic.open_float() end, "[V]iew [D]iagnostics")
        map("n", "[d", function() vim.diagnostic.goto_prev() end, "Prev Diagnostic")
        map("n", "]d", function() vim.diagnostic.goto_prev() end, "Next Diagnostic")
        map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, "View Workspace")
    end
})

local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'luasnip'},
        {name = 'nvim_lua'},
    },
    formatting = {
        feilds = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }

            --item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),

        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
    }),
})

local lspconfig = require("lspconfig")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_config = {capabilities = lsp_capabilities}

local servers = {
    lua_ls = default_config,
    rust_analyzer = {},
    pyright = {},
}
for name, config in pairs(servers) do
    lspconfig[name].setup(config)
end
