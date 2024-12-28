local map = vim.keymap.set
local default_opts = { noremap = true }
local default_opts_silent = { noremap = true, silent = true }

-- Системный буфер обмена shift - Y
map("v", "<Leader>y", '"+y', default_opts)
-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
map("i", "jj", "<Esc>", default_opts)
-- Стрелочки откл. Использовать hjkl
map("", "<up>", ':echoe "Use k"<CR>', default_opts)
map("", "<down>", ':echoe "Use j"<CR>', default_opts)
map("", "<left>", ':echoe "Use h"<CR>', default_opts)
map("", "<right>", ':echoe "Use l"<CR>', default_opts)
-- Сохранение по CTRL-s , как в нормальном, так и в insert режиме
map("n", "<C-s>", "<CR>:w<CR>", default_opts_silent)
map("i", "<C-s>", "<esc><CR>:w<CR>", default_opts_silent)
-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", default_opts_silent)
map("n", "<Leader><Tab>", ":BufferLineCyclePrev<CR>", default_opts_silent)
-- Пролистнуть на страницу вниз / вверх (как в браузерах)
map("n", "<Leader>j", "<PageDown> zz", default_opts_silent)
map("n", "<Leader>k", "<PageUp> zz", default_opts_silent)
-- Перевод в командной строке
map("n", "t", "<Plug>Translate", default_opts_silent)
map("n", "tt", "V:Translate<CR>", default_opts_silent)
map("v", "t", "<Plug>TranslateV", default_opts_silent)
map("v", "tt", "V:Translate<CR>", default_opts_silent)
-- Заменить текст переводом
map("n", "r", "<Plug>TranslateR", default_opts_silent)
map("n", "rr", "V:TranslateR<CR>", default_opts_silent)
map("v", "r", "<Plug>TranslateRV", default_opts_silent)
map("v", "rr", "V:TranslateR<CR>", default_opts_silent)
-- Перевод текста из буфера обмена
map("n", "x", "<Plug>TranslateX", default_opts)
-- fzf
map("n", "<C-a>", [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts_silent)
map("n", "<C-p>", [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts_silent)

-----------------------------------------------------------
-- Фн. клавиши по F1 .. F12
-----------------------------------------------------------
-- По F1 очищаем последний поиск с подсветкой
map("n", "<F1>", ":nohl<CR>", default_opts_silent)
-- <F3> Открыть всю nvim конфигурацию для редактирования
map(
	"n",
	"<F3>",
	":e ~/.config/nvim/init.lua<CR>:e ~/.config/nvim/lua/plugins.lua<CR>:e ~/.config/nvim/lua/settings.lua<CR>:e ~/.config/nvim/lua/keymaps.lua<CR>:e ~/.config/nvim/lua/lsp.lua<CR>",
	default_opts_silent
)
-- <F4> Поиск слова под курсором
map("n", "<F4>", [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts_silent)
-- <C-F4> Поиск слова в модальном окошке
map("n", "<S-F4>", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts_silent)
-- <F5> разные вариации нумераций строк, можно переключаться
map("n", "<F5>", ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts_silent)
-- <F6> дерево файлов.
map("n", "<F6>", ":NvimTreeRefresh<CR>:NvimTreeToggle<CR>", default_opts_silent)
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
map("n", "<F8>", ":TagbarToggle<CR>", default_opts_silent)
-- <F11> Проверка орфографии  для русского и английского языка
map("n", "<F11>", ":set spell!<CR>", default_opts_silent)
map("i", "<F11>", "<C-O>:set spell!<CR>", default_opts_silent)
