" ==================================================================
" ====			PLUG-IN SETUP & INSTALL			====
" ==================================================================

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'

Plug 'ryanoasis/vim-devicons'

" lightline
Plug 'itchyny/lightline.vim'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Material theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" git plugin
Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" AT&T assembly syntax highlightning
Plug 'Shirk/vim-gas', { 'on': 'assembly' } 

"rust plugin
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" Syntastic
Plug 'vim-syntastic/syntastic'

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' } |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'codehearts/mascara-vim'


" Initialize plugin system
call plug#end()

" ----------------------------------------------------------------------------------------

" =======================
" == LightLine Config ===
" =======================
set noshowmode
let g:lightline = { 
      \ 'colorscheme': 'material_vim',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" ===================
" == Theme Config ===
" ===================
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
"
"   For Neovim > 0.1.5 and Vim > patch 7.4.1799 -
"   https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
"   Based on Vim patch 7.4.1770 (`guicolors` option) -
"   https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
"   https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
    set termguicolors
endif

let g:material_theme_style = 'darker'
let g:material_terminal_italics = 1
colorscheme material


" =================
" === Syntastic ===
" =================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ===================
" === Rust Config ===
" ===================
let g:rustfmt_autosave = 1

" ===========================
" === General Nvim config ===
" ===========================
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'rust', 'haskell', 'c', 'cpp']

set number
set noshowcmd
set clipboard=unnamed
set expandtab
set shiftwidth=4
set nowrap
set nocursorline
set hidden
set cmdheight=2
set updatetime=300

filetype plugin indent on
syntax on

" syntax
au BufRead,BufNewFile *.s set filetype=gas"

"Keybinds
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-K> :update<cr>
inoremap <C-K> <Esc>:update<cr>gi
nnoremap td  :tabclose<CR>

set pastetoggle=<F3>

" coc keymaps
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"=========================
" === misc plugin setup ==
" ========================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:UltiSnipsExpandTrigger = '<f5>'
