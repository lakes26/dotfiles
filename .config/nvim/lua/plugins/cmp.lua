return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
        {
            "rafamadriz/friendly-snippets",
            config = function ()
                require("luasnip.loaders.from_vscode").lazy_load()
            end
        }
    },
    event = "InsertEnter",
    opts = function(_, opts)
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        return vim.tbl_deep_extend("force", opts, {
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-e>"] = cmp.mapping.complete(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                -- Super tab
                ["<tab>"] = cmp.mapping(function(fallback)
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.jump(1)
                    elseif cmp.visible() then
                        cmp.select_next_item()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<s-tab>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    elseif cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp", priority = 20 },
                { name = "luasnip", priority = 10 },
                { name = "buffer", priority = 1 },
                { name = "path", priority = 1 },
                { name = "nvim_lsp_signature_help" },
            },
            formatting = {
                format = {
                    menu = {
                        nvim_lsp = "(LSP)",
                        nvim_lsp_signature_help = "x",
                        luasnip = "(LuaSnip)",
                        buffer = "(Buffer)",
                        path = "(Path)",
                    },
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = "…",
                },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sorting = {
                comparators = {
                    cmp.config.compare.offest,
                    cmp.config.compare.exact,

                    cmp.config.compare.score,

                    function(entry1, entry2)
                        local _, entry1_under = entry1.completion_item.label:find("^_+")
                        local _, entry2_under = entry2.completion_item.label:find("^_+")
                        entry1_under = entry1_under or 0
                        entry2_under = entry2_under or 0
                        if entry1_under > entry2_under then
                            return false
                        elseif entry1_under < entry2_under then
                            return true
                        end
                    end,

                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,

                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            experimental = {
                ghost_text = true,
            },
        })
    end,
    config = function(_, opts)
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        cmp.setup(vim.tbl_deep_extend("force", opts, {
            sources = cmp.config.sources(opts.sources),
            formatting = {
                format = lspkind.cmp_format(opts.formatting.format),
            }
        }))
    end,
}
