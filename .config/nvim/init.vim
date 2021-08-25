" * * * * * * * * * * * * 
" Plugins
" * * * * * * * * * * * * 

call plug#begin('~/.config/nvim/plugged')

" Language Server Protocol plugins
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Update parsers on update
Plug 'tikhomirov/vim-glsl'

" Tabline
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Misc, non-essentials
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
" HTML and HTML-templates
    Plug 'lepture/vim-jinja'
" Vim Wiki
    Plug 'vimwiki/vimwiki'
" LaTeX
    Plug 'lervag/vimtex'
" Haskell
    Plug 'neovimhaskell/haskell-vim'

call plug#end()

" * * * * * * * * * * * * 
" Theme 		  
" * * * * * * * * * * * * 

set signcolumn=yes

"set relativenumber
set number
set splitbelow

" colors
highlight LineNr ctermfg=grey
highlight VertSplit cterm=NONE ctermfg=black

let g:indentLine_fileTypeExclude = ['startify']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_bufNameExclude = ['term:*']

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
"
let g:airline#extensions#tabline#enabled = 1
source $HOME/.config/nvim/plugged-config/airline.vim

" Autocomplete / suggestion syntax
hi Pmenu ctermbg=black ctermfg=white

" * * * * * * * * * * * * 
" Language Syntax
" * * * * * * * * * * * * 

source $HOME/.config/nvim/plugged-config/treesitter.vim

" CSS
autocmd FileType scss setl iskeyword+=@-@

" C and C++
autocmd Filetype cpp setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype cpp setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype c setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" glsl
autocmd BufEnter,BufNew *.glsl setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

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

" FZF
source $HOME/.config/nvim/plugged-config/fzf.vim

" FuGitive
source $HOME/.config/nvim/plugged-config/fugitive.vim

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

" Tab navigation 
map <C-h>         :tabprev<CR>
map <C-l>         :tabnext<CR>
nnoremap <C-t>    :tabnew<CR>

" Tab indentation
xnoremap <TAB> =

" autocomplete on newline
let g:lexima_enable_basic_rules = 0
let g:lexima_enable_newline_rules = 1

" LSP, autocomplete, suggestions configs
source $HOME/.config/nvim/plugged-config/lsp.vim
source $HOME/.config/nvim/plugged-config/completion.vim
luafile $HOME/.config/nvim/lua/plugins/lsp-diagnostics.lua
luafile $HOME/.config/nvim/lua/plugins/compe.lua

" Use completion-nvim in every buffer
"autocmd BufEnter * lua require'completion'.on_attach()

" Language plugins
luafile $HOME/.config/nvim/lua/plugins/languages.lua

" Terminal
let g:term_buf = 0
let g:term_win = 0

" Terminal (internal & external)
nnoremap <F5> :!$TERMINAL -e ranger & <cr><cr>
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
" Utility 		  
" * * * * * * * * * * * * 

let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/'}]

