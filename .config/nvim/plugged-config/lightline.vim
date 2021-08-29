let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'tab_component_function': {
      \   'tabnum': 'LightlineWebDevIcons',
      \ },
      \ }

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction
