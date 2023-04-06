" 使用 Zathura PDF 查看器打开 PDF 文件
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" 使用 LaTeX 引擎
let g:tex_flavor = 'latex'

" 禁用 Quickfix 模式
let g:vimtex_quickfix_mode = 0

" 启用自动缩进和插件支持
filetype plugin indent on


if !exists('g:loaded_vimtex')
  let g:loaded_vimtex = 1

  " 设置编译器序列和编译选项
  function! s:SetCompiler() abort
    if expand('%:t') ==# 'paper.tex'
      let g:vimtex_compiler_engine = 'pdflatex'
      let g:vimtex_compiler_options = {
            \ '-interaction': 'nonstopmode',
            \ '-file-line-error': '',
            \ '-synctex': '1',
            \ '-shell-escape': '',
            \ '-bibtex': '',
          \ }
      let g:vimtex_bibtex_process = 2
      let g:vimtex_compiler_args = ['-pdf', '-pvc', '-pvw']
    else
      let g:vimtex_compiler_engine = 'xelatex'
      let g:vimtex_compiler_options = {
            \ '-interaction': 'nonstopmode',
            \ '-file-line-error': '',
            \ '-synctex': '1',
            \ '-shell-escape': '',
          \ }
      let g:vimtex_pdflatex_build_command = 'latexmk -pdf -xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S'
      let g:vimtex_view_method = 'zathura'
      let g:vimtex_view_options = {
            \ '--fork': '',
            \ '--synctex-forward': '%n:0:%b',
            \ '--unique': '',
            \ '--preserve-window': '',
          \ }
      let g:vimtex_automatic_view = 1
    endif
  endfunction

  " 根据文件类型自动选择编译器序列和编译选项
  let g:vimtex_compiler_selectors = [
        \ { 'is_file': 'ppt.tex', 'action': 'call <SID>SetCompiler()' },
        \ { 'is_file': 'paper.tex', 'action': 'call <SID>SetCompiler()' },
      \ ]

  " 自动切换为 zathura 前端
  let g:vimtex_automatic_view = 1

  " 快捷键
  let g:tex_flavor = 'latex'
  nnoremap <Leader>l :VimtexCompile<CR>
  nnoremap <Leader>v :VimtexView<CR>
endif
