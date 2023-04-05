" 使用 LaTeX 引擎
let g:tex_flavor = 'latex'

" 禁用 Quickfix 模式
let g:vimtex_quickfix_mode = 0

" 启用自动缩进和插件支持
filetype plugin indent on

" 使用 Zathura PDF 查看器打开 PDF 文件
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" 设置编译器选项
let g:vimtex_compiler_options = {'-parser': 'tree-sitter'}
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_verbose = 1
