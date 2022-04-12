" * * * * * * * * * * * *
" Plugins
" * * * * * * * * * * * *

call plug#begin('~/.config/nvim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/lsp_signature.nvim'

" Snippet plugin, required by nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Update parsers on update
Plug 'tikhomirov/vim-glsl'
Plug 'TovarishFin/vim-solidity'

" Tabline
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

" Indenatation
Plug 'cohama/lexima.vim'
Plug 'Yggdroot/indentLine'

" Git
    Plug 'tpope/vim-fugitive'
" File and project management.
    Plug 'mhinz/vim-startify'
    Plug 'voldikss/vim-floaterm'
    Plug 'junegunn/fzf.vim'
    Plug 'dkprice/vim-easygrep'

"
" Language specifics:
"
" Vim Wiki
    Plug 'vimwiki/vimwiki'
" LaTeX
    Plug 'lervag/vimtex'

call plug#end()

" * * * * * * * * * * * *
" Theme
" * * * * * * * * * * * *

source $HOME/.config/nvim/plugged-config/indentline.vim
source $HOME/.config/nvim/plugged-config/lightline.vim

set signcolumn=yes

"set relativenumber
set number
set splitbelow

" colors
hi LineNr ctermfg=grey
hi VertSplit cterm=NONE ctermfg=black
hi Search ctermbg=white
hi Search ctermfg=black
hi clear SignColumn

" autocomplete
hi CmpItemAbbrDeprecated ctermbg=red gui=strikethrough ctermfg=gray
hi CmpItemAbbrMatch ctermbg=NONE ctermfg=DarkBlue
hi CmpItemAbbrMatchFuzzy ctermbg=NONE ctermfg=DarkBlue
hi CmpItemKindVariable ctermbg=NONE ctermfg=blue
hi CmpItemKindInterface ctermbg=NONE ctermfg=blue
hi CmpItemKindText ctermbg=NONE ctermfg=blue
hi CmpItemKindFunction ctermbg=NONE ctermfg=DarkMagenta
hi CmpItemKindMethod ctermbg=NONE ctermfg=DarkMagenta
hi CmpItemKindKeyword ctermbg=NONE ctermfg=white
hi CmpItemKindProperty ctermbg=NONE ctermfg=white
hi CmpItemKindUnit ctermbg=NONE ctermfg=white
hi Pmenu ctermbg=black ctermfg=white
hi PmenuSel ctermbg=DarkGray ctermfg=white


" startify
let g:startify_custom_header = [
    \ '  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     __                 ',
    \ '    _____    __  __  /\_\    ____ ____   ',
    \ '   /  _  \  /\ \/\ \ \/\ \  /  __ __  \  ',
    \ '   /\ \/\ \ \ \ \_/ | \ \ \ /\ \/\ \/\ \ ',
    \ '   \ \_\ \_\ \ \___/   \ \_\\ \_\ \_\ \_\',
    \ '    \/_/\/_/  \/__/     \/_/ \/_/\/_/\/_/',
    \ ]

" * * * * * * * * * * * *
" Syntax and autocomplete.
" * * * * * * * * * * * *
source $HOME/.config/nvim/plugged-config/fzf.vim
source $HOME/.config/nvim/plugged-config/fugitive.vim
luafile $HOME/.config/nvim/lua/plugins/treesitter.lua
luafile $HOME/.config/nvim/lua/plugins/languages.lua
luafile $HOME/.config/nvim/lua/plugins/diagnostics.lua
luafile $HOME/.config/nvim/lua/plugins/keybindings.lsp.lua
luafile $HOME/.config/nvim/lua/plugins/completion.lsp.lua

" CSS
autocmd FileType scss setl iskeyword+=@-@

" C and C++
autocmd Filetype cpp setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype cpp setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype c setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Solidity
autocmd Filetype solidity setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

function ClangFormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
    "redraw
  endif
endfunction
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.hh,*.cc :call ClangFormatBuffer()

" By file ending
autocmd BufEnter,BufNew *.glsl setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd BufEnter,BufNew *.rs setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" LaTeX
let g:tex_conceal = ""
"let g:vimtex_syntax_conceal_default = 0
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

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" * * * * * * * * * * * *
" Usability
" * * * * * * * * * * * *

" Substitute live preview
set inccommand=nosplit

" Prevent having to press enter after running function, NOTE: might break
" stuff
set cmdheight=2

" Remove trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e

" Use case-insensitive search when pattern is lowercase.
set ignorecase
set smartcase

" Yank line to end
nnoremap Y yg_
vnoremap Y yg_

" Easy leader key
map <space> <leader>

set shortmess=A " No swapfile nagging
set clipboard=unnamedplus " No bs clipboard
set undodir=~/.cache/nvim/undo
set undofile
set scrolloff=10 " Margin of scroll
set mouse=a
command W w
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Clear search highlight
map <leader>n     :noh<CR>

" Tab navigation
map <C-h>         :tabprev<CR>
map <C-l>         :tabnext<CR>
nnoremap <C-t>    :tabnew<CR>

" Tab indentation
xnoremap <TAB> =

" autocomplete on newline
let g:lexima_enable_basic_rules = 0
let g:lexima_enable_newline_rules = 1

" luafile $HOME/.config/nvim/lua/plugins/lsp-diagnostics.lua

" Use completion-nvim in every buffer
"autocmd BufEnter * lua require'completion'.on_attach()

" Terminal
let g:term_buf = 0
let g:term_win = 0

" Terminal (internal & external)
nnoremap <F5> :!$TERMINAL -e lfub & <cr><cr>
nnoremap <F6> :!$TERMINAL & <cr><cr>
let g:floaterm_keymap_toggle = '<F4>'
let g:floaterm_keymap_prev   = '<F2>'
let g:floaterm_keymap_next   = '<F3>'
let g:floaterm_keymap_new    = '<Leader>ft'
let g:floaterm_keymap_kill   = '<Leader><F4>'
hi FloatermBorder guibg=orange guifg=cyan

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" * * * * * * * * * * * *
" Misc
" * * * * * * * * * * * *

let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/'}]

