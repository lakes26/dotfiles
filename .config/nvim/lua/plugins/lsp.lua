return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Mason
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Cmp
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",

            -- Fidget
            "j-hui/fidget.nvim",
        },
        lazy = false,
        keys = {
            {
                "gk",
                "<cmd>Lspsaga hover_doc<cr>",
                desc = "LSP hover",
            },
            {
                "gK",
                "<cmd>Lspsaga hover_doc ++keep<cr>",
                desc = "LSP hover (sticky)",
            },
            {
                "<leader>rn",
                "<cmd>Lspsaga rename ++project<cr>",
                desc = "Rename word under cursor"
            },
            {
                "<leader>ca",
                "<cmd>Lspsaga code_action<cr>",
                desc = "Code Actions"
            },
            {
                "gp",
                "<cmd>Lspsaga peek_definition<cr>",
                desc = "Peek definition"
            },
            {
                "gd",
                "<cmd>Lspsaga goto_definition<cr>",
                desc = "Goto definition"
            },
            {
                "gY",
                "<cmd>Lspsaga goto_type_definition<cr>",
                desc = "Goto type definition"
            },
            {
                "gy",
                "<cmd>Lspsaga peek_type_definition<cr>",
                desc = "Peek type definition"
            },
            {
                "gr",
                "<cmd>Lspsaga finder<cr>",
                desc = "Show references"
            },
            {
                "<leader>o",
                "<cmd>Lspsaga outline<cr>",
                desc = "Show outline"
            },
            {
                "[d",
                "<cmd>Lspsaga diagnostic_jump_prev<cr>",
                desc = "Goto previous diagnostic"
            },
            {
                "]d",
                "<cmd>Lspsaga diagnostic_jump_next<cr>",
                desc = "Goto next diagnostic"
            },
            {
                "[D",
                "<cmd>lua require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>",
                desc = "Goto previous diagnostic error"
            },
            {
                "]D",
                "<cmd>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>",
                desc = "Goto next diagnostic error"
            },
            {
                "<leader>sl",
                "<cmd>Lspsaga show_line_diagnostics ++unfocus<cr>",
                desc = "Show line diagnostics"
            },
        },

        config = function()
            local servers = {
                bashls = {
                    filetypes = { "sh", "bash", "zsh", "csh", "ksh" }
                }
            }

            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities())

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "bashls"
                },
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities,
                            -- filetypes = (servers[server_name] or {}).filetypes,
                        }
                    end,

                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    runtime = { version = "Lua 5.1" },
                                    diagnostics = {
                                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                                    }
                                }
                            }
                        }
                    end,
                },
            })
        end
    },

    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            local sign = function(hl, icon)
                vim.fn.sign_define(hl, {
                    texthl = hl,
                    text = icon,
                    numhl = '',
                })
            end
            sign("DiagnosticSignError", "x")
        end
    },

    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
        },
        event = "LspAttach",
        cmd = "Lspsaga",
        opts = {
            scroll_preview = {
                scroll_down = "<c-d>",
                scroll_up = "<c-u>",
            },
            ui = {
                border = "rounded"
            },
            code_action = {
                keys = {
                    quit = { "q", "<esc>" }
                },
            },
            symbols_in_winbar = {
                respect_root = true,
            }
        }
    },
}
