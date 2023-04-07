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

" 激活 vimtex 插件
let g:vimtex_enabled = 1

" 设置默认编译器为 latexmk，并启用连续模式
let g:vimtex_compiler_latexmk = {
      \ 'backend' : 'nvim',
      \ 'background' : 1,
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

" 定义paper的编译顺序
let g:vimtex_compiler_latexmk_eng = deepcopy(g:vimtex_compiler_latexmk)
let g:vimtex_compiler_latexmk_eng['options'] += ['-pdflatex=pdflatex']

" 定义ppt的编译顺序
let g:vimtex_compiler_latexmk_chn = deepcopy(g:vimtex_compiler_latexmk)
let g:vimtex_compiler_latexmk_chn['options'] += ['-xelatex=xelatex']

" 定义编译paper的函数
function! CompilePaper()
  let l:current_options = g:vimtex_compiler_latexmk['options']
  let g:vimtex_compiler_latexmk['options'] = g:vimtex_compiler_latexmk_eng['options']
  call vimtex#compiler#compile()
  let g:vimtex_compiler_latexmk['options'] = l:current_options
endfunction

" 定义编译ppt的函数
function! CompilePPT()
  let l:current_options = g:vimtex_compiler_latexmk['options']
  let g:vimtex_compiler_latexmk['options'] = g:vimtex_compiler_latexmk_chn['options']
  call vimtex#compiler#compile()
  let g:vimtex_compiler_latexmk['options'] = l:current_options
endfunction

" 为paper绑定快捷键 <leader>ll
nnoremap <silent> <leader>ll :call CompilePaper()<CR>

" 为ppt绑定快捷键 <leader>lp
nnoremap <silent> <leader>lp :call CompilePPT()<CR>
