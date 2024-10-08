return {
    --PRIMEAGENS UPDATED LSP WITHOUT LSPZERO
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function()
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { 'lua_ls', 'clangd', 'gopls' },
            handlers = {
                function (server_name) --default handler (optional)
                    require("lspconfig")[server_name].setup {
                    }
                end,
                ["lua_ls"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                },
                            }
                        }
                    }
                end
            }
        })
        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
            })
        })
        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            }
        })
    end
}

--PUT IN THEPRIMEGEN\INIT.LUA??
--autocmd('LspAttach', {
    --group = ThePrimeagenGroup,
    --callback = function(e)
        --local opts = { buffer = e.buf }
        --vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        --vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        --vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references() end, opts)
        --vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        --vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
    --end
--})
