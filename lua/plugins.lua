-- lua/plugins.lua

return {

	-----------------------------------------------------------
	-- ПЛАГИНЫ ВНЕШНЕГО ВИДА
	-----------------------------------------------------------

	-- Цветовая схема
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},

	-- Информационная строка внизу
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "nordic",
				},
			})
		end,
	},

	-- Табы вверху
	{
		"akinsho/bufferline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("bufferline").setup()
		end,
	},

	-----------------------------------------------------------
	-- НАВИГАЦИЯ
	-----------------------------------------------------------

	-- Файловый менеджер
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
		end,
	},

	-- Навигация внутри файла по классам и функциям
	{ "majutsushi/tagbar" },

	-- Замена fzf и ack
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup()
		end,
	},

	-----------------------------------------------------------
	-- LSP и автодополнялка
	-----------------------------------------------------------

	-- Highlight, edit, and navigate code using a fast incremental parsing library
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Collection of configurations for built-in LSP client
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/nvim-lsp-installer" },

	-- Автодополнялка
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "saadparwaiz1/cmp_luasnip" },
	-- Автодополнлялка к файловой системе
	{ "hrsh7th/cmp-path" },

	-- Snippets plugin
	{ "L3MON4D3/LuaSnip" },

	-----------------------------------------------------------
	-- PYTHON
	-----------------------------------------------------------

	-- Шапка с импортами приводим в порядок
	--    { 'fisadev/vim-isort' },

	-- Поддержка темплейтом jinja2
	--    { 'mitsuhiko/vim-jinja' },

	-----------------------------------------------------------
	-- HTML и CSS
	-----------------------------------------------------------

	-- Подсвечивает закрывающий и откры. тэг
	{ "idanarye/breeze.vim" },

	-- Закрывает автоматом html и xml тэги
	{ "alvan/vim-closetag" },

	-- Подсвечивает #ffffff
	{ "ap/vim-css-color" },

	-----------------------------------------------------------
	-- РАЗНОЕ
	-----------------------------------------------------------

	-- Даже если включена русская раскладка vim команды будут работать
	{ "powerman/vim-plugin-ruscmd" },

	-- ]p - вставить на строку выше, [p - ниже
	{ "tpope/vim-unimpaired" },

	-- Переводчик рус - англ
	{ "voldikss/vim-translator" },

	-- popup окошки
	{ "nvim-lua/popup.nvim" },

	-- Обрамляет или снимает обрамление. Выдели слово, нажми S и набери <h1>
	{ "tpope/vim-surround" },

	-- Считает кол-во совпадений при поиске
	{ "google/vim-searchindex" },

	-- Может повторять через . vimsurround
	{ "tpope/vim-repeat" },

	-- Стартовая страница, если просто набрать vim в консоле
	{ "mhinz/vim-startify" },

	-- Комментирует по gc все, вне зависимости от языка программирования
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Обрамляет строку в теги по ctrl-y + ,
	{ "mattn/emmet-vim" },

	-- Закрывает автоматом скобки
	{ "cohama/lexima.vim" },

	-- Линтер, работает для всех языков
	{ "dense-analysis/ale" },
	-- Тренировка команд vim
	{ "ThePrimeagen/vim-be-good" },
	-- 'Автоформатирование' кода для всех языков
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<C-A-l>",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				json = { "jq" },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500 },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"vscode-neovim/vscode-multi-cursor.nvim",
		event = "VeryLazy",
		cond = not not vim.g.vscode,
		opts = {},
		config = function()
			require("Comment").setup()
		end,
	},
}
