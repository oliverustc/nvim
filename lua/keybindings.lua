vim.g.mapleader = "\\"
vim.g.maplocalleader = ","
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

--  文件保存
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>q", ":q<CR>", opt)
map("n", "<leader>x", ":x<CR>", opt)

map("i", "<leader>w", "<Esc>:w<CR>a", opt)
map("i", "<leader>q", "<Esc>:q<CR>", opt)
map("i", "<leader>x", "<Esc>:x<CR>", opt)

map("i", "<C-i>", "<C-o>I", opt)     -- insert: ctrl+i 移动到行首
map("i", "<C-a>", "<C-o>A", opt)     -- insert：ctrl+a 移动到行尾
map("i", "<C-w>", "<C-o>w", opt)     -- insert：ctrl+w 移动到下一个单词
map("i", "<C-b>", "<C-o>b", opt)     -- insert：ctrl+b 移动到下一个单词
map("i", "<C-h>", "<C-o>h", opt)     -- insert：ctrl+h 向左移动
map("i", "<C-l>", "<C-o>l", opt)     -- insert：ctrl+l 向右移动
map("i", "<C-j>", "<C-o>j", opt)     -- insert: ctrl+j 移动到下一行
map("i", "<C-k>", "<C-o>k", opt)     -- insert: ctrl+k 移动到上一行
map("i", "<C-d>", "<C-o>5j", opt)    -- insert: ctrl+d 移动到下5行
map("i", "<C-u>", "<C-o>5k", opt)    -- insert: ctrl+u 移动到上5行
map("i", "jj",    "<Esc>", opt)
map("i", "<Tab>", "<Esc>", opt)
-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>i", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>i", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "K", ":move '<-2<CR>gv-gv", opt)
map("v", "J", ":move '>+1<CR>gv-gv", opt)

-- ctrl u / ctrl + d  移动10行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- bufferline
-- 左右Tab切换
map("n", "<leader>k", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>j", ":BufferLineCycleNext<CR>", opt)
map("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opt)
map("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opt)
map("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opt)
map("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opt)
map("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opt)
map("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", opt)
map("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", opt)

-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)


-- 插件快捷键
local pluginKeys = {}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}


-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
  -- 分屏打开文件
  { key = "v",                            action = "vsplit" },
  { key = "h",                            action = "split" },
  -- 显示隐藏文件
  { key = "i",                            action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".",                            action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>",                         action = "refresh" },
  { key = "a",                            action = "create" },
  { key = "d",                            action = "remove" },
  { key = "r",                            action = "rename" },
  { key = "x",                            action = "cut" },
  { key = "c",                            action = "copy" },
  { key = "p",                            action = "paste" },
  { key = "s",                            action = "system_open" },
}


-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)

  return {
      -- 出现补全
      ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
      -- 取消
      ["<A-,>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close()
      }),
      -- 上一个
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      -- 下一个
      ["<C-j>"] = cmp.mapping.select_next_item(),
      -- 确认
      ["<CR>"] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace
      }),
      -- 如果窗口内容太多，可以滚动
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
  }
end

return pluginKeys
