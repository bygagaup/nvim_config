-- lua/plugins.lua

return {
	'ThePrimeagen/vim-be-good',
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('plugins.nordic')
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('plugins.lualine')
    end
  },
  {
    'sbdchd/neoformat',
    config = function()
            -- Пример настройки Neoformat
            vim.g.neoformat_enabled_python = {'black'}
            vim.g.neoformat_enabled_javascript = {'prettier'}
            vim.g.neoformat_enabled_java = {'uncrustify'}
            vim.g.neoformat_enabled_lua = {'luaformatter'}
            -- Вы можете добавить другие настройки по вашему желанию
        end
    },
    {
    'mfussenegger/nvim-dap'
    },
    {
      'mfussenegger/nvim-jdtls'
    },
    {
'nvim-lua/plenary.nvim'
    }
}
