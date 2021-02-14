" Include plugin configs
source $HOME/.config/nvim/plugged-config/fzf.vim

" * * * * * * * * * * * * 
" Theme 		  
" * * * * * * * * * * * * 

set relativenumber
set number
set splitbelow

highlight LineNr ctermfg=grey
highlight VertSplit cterm=NONE

let g:indentLine_fileTypeExclude = ['startify']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_bufNameExclude = ['term:*']
autocmd TermOpen * setlocal nonumber norelativenumber

" startify
let g:startify_custom_header = [
    \ '  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     __                 ',
    \ '    _____    __  __  /\_\    ____ ____   ', 
    \ '   /  _  \  /\ \/\ \ \/\ \  /  __ __  \  ', 
    \ '   /\ \/\ \ \ \ \_/ | \ \ \ /\ \/\ \/\ \ ', 
    \ '   \ \_\ \_\ \ \___/   \ \_\\ \_\ \_\ \_\',
    \ '    \/_/\/_/  \/__/     \/_/ \/_/\/_/\/_/',
    \ ]

" Airline
let g:airline#extensions#tabline#enabled = 1

" Autocomplete / suggestion syntax
hi Pmenu ctermbg=black ctermfg=white

" * * * * * * * * * * * * 
" Language Syntax
" * * * * * * * * * * * * 

" HTML5
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" C++
let g:lsp_cxx_hl_use_text_props = 1

" LaTeX
let g:tex_conceal = ""
let g:vimtex_syntax_conceal_default = 0
let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'hooks' : [],
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

" * * * * * * * * * * * * 
" Usability 		  
" * * * * * * * * * * * * 

set shortmess=A " No swapfile nagging
set clipboard=unnamed,unnamedplus " No bs clipboard
set undodir=~/.cache/nvim/undo
set undofile
set scrolloff=10 " Margin of scroll
set mouse=a
command W w
map <C-c> "+y
map <C-p> "+p
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Tab navigation 
map <C-h>         :tabprev<CR>
map <C-l>         :tabnext<CR>
nnoremap <C-t>    :tabnew<CR>

" Tab indentation
xnoremap <TAB> =

" FZF bindings
map <C-p>         :FZF<CR>
map <leader>p     :Rg<CR> 
map <C-b>         :Buffers<CR>
map <leader>b     :Lines<CR>

" autocomplete on newline
let g:lexima_enable_basic_rules = 0
let g:lexima_enable_newline_rules = 1

" CoC settings
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Terminal
let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


" Terminal (internal & external)
nnoremap <F4> :call Term_toggle(10)<cr>
"tnoremap <F4> <C-\><C-n>:call Term_toggle(10)<cr>
nnoremap <F5> :!$TERMINAL -e ranger & <cr><cr>
nnoremap <F6> :!$TERMINAL & <cr><cr>
let g:floaterm_keymap_toggle = '<F4>'
hi FloatermBorder guibg=orange guifg=cyan

" Disable arrow keys 
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" * * * * * * * * * * * * 
" Utility 		  
" * * * * * * * * * * * * 

let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/'}]

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'alvan/vim-closetag'
Plug 'cohama/lexima.vim'
Plug 'Yggdroot/indentLine'
Plug 'svermeulen/vim-easyclip'
Plug 'voldikss/vim-floaterm'
" File management
    Plug 'junegunn/fzf.vim'
    Plug 'dkprice/vim-easygrep'
" Javascript
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'heavenshell/vim-jsdoc', { 
          \ 'for': ['javascript', 'javascript.jsx','typescript'], 
          \ 'do': 'make install'
          \}
" Css
    Plug 'ap/vim-css-color'
" HTML 
    Plug 'mattn/emmet-vim'
" Vim Wiki
    Plug 'vimwiki/vimwiki'
" Python
    " Depends on: pip3 install pynvim --upgrade 
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" C++/C
    Plug 'jackguo380/vim-lsp-cxx-highlight'
" Godot
    Plug 'habamax/vim-godot'
" LaTeX
    Plug 'lervag/vimtex'

call plug#end()
