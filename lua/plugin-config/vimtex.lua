-- 加载vimtex插件
require('vimtex')
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_viewer = "okular"


-- 设置<leader>t为生成PDF的快捷键
vim.api.nvim_set_keymap('n', '<leader>t', ':VimtexCompile<CR>', { noremap = true, silent = true })
-- 设定快捷键
vim.api.nvim_set_keymap('n', '<leader>ll', '<plug>(vimtex-compile)', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>lv', '<plug>(vimtex-view)', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>lt', '<plug>(vimtex-toc-toggle)', {silent = true})
