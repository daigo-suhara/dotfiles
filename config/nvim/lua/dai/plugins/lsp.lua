return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- LspAttach オートコマンド
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("dai-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("<leader>cd", vim.lsp.buf.hover, "[C]ode [D]ocumentation", { "n", "x" })
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Open [D]ocument [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"Open [W]orkspace [S]ymbols"
					)
					map("gt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client:supports_method("textDocument/documentHighlight") then
						local highlight_augroup = vim.api.nvim_create_augroup("dai-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})
					end

					if client and client:supports_method("textDocument/inlayHint") then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- cmp との統合
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local status_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if status_cmp_nvim_lsp then
				capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
			end

			-- サーバー設定のテーブル
			local servers = {
				lua_ls = {
					cmd = { "lua-language-server" },
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) },
							completion = { callSnippet = "Replace" },
						},
					},
				},
				rust_analyzer = {
					cmd = { "rust-analyzer" },
				},
				intelephense = {
					cmd = { "intelephense", "--stdio" },
				},
				nil_ls = {
					cmd = { "nil" },
				},
				gopls = {
					cmd = { "gopls" },
					filetypes = { "go", "gomod", "gowork", "gotmpl" },
					settings = {
						gopls = {
							completeUnimported = true,
							usePlaceholders = true,
							staticcheck = true,
							analyses = {
								unusedparams = true,
								unusedwrite = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
						},
					},
				},
				pyright = {
					cmd = { "pyright-langserver", "--stdio" },
				},
				vtsls = {
					cmd = { "vtsls", "--stdio" },
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
				},
				eslint = {
					cmd = { "vscode-eslint-language-server", "--stdio" },
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
						"vue",
						"svelte",
					},
				},
				emmet_ls = {
					cmd = { "emmet-ls", "--stdio" },
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				},
				biome = {
					cmd = { "biome", "lsp-proxy" },
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
						"json",
						"jsonc",
						"css",
					},
				},
			}

			for name, config in pairs(servers) do
				config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
				vim.lsp.config(name, config)
				vim.lsp.enable(name)
			end
		end,
	},
}
