" ==================================================================
" ====			PLUG-IN SETUP & INSTALL			====
" ==================================================================

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/c.vim'

Plug 'tpope/vim-dispatch'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'md'  }

Plug 'airblade/vim-gitgutter'


Plug 'lervag/vimtex', {'for': 'tex'} 

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
Plug 'Shirk/vim-gas', { 'for': 's' } 

"rust plugin
Plug 'rust-lang/rust.vim', {'for': 'rust'}

"Plug 'vim-syntastic/syntastic'

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' } |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Initialize plugin system
call plug#end()

" ----------------------------------------------------------------------------------------
set guifont=FiraCode\ NF

" =======================
" == LightLine Config ===
" =======================
set noshowmode
let g:lightline = {
            \ 'colorscheme': 'material_vim',
            \ 'active': {
            \     'left': [
            \         [ 'mode', 'paste' ],
            \         [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \    },
            \ 'component_function': {
            \         'gitbranch': 'FugitiveHead',
            \         'cocstatus': 'coc#status'
            \     }
            \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" ===================
" == Theme Config ===
" ===================
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
    set termguicolors
endif

let g:material_theme_style = 'darker'
let g:material_terminal_italics = 1
colorscheme material

" ===================
" === Rust Config ===
" ===================
let g:rustfmt_autosave = 1

" ===========================
" === General Nvim config ===
" ===========================
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'rust', 'haskell', 'c', 'cpp']

set number relativenumber
set encoding=UTF-8
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
" syntax on

" syntax
au BufRead,BufNewFile *.s set filetype=gas"

"Keybinds
" Map <ALT>+<hjkl> to move in insert mode 
nnoremap <C-c> <silent> <C-c>
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-K> :update<cr>
inoremap <C-K> <Esc>:update<cr>gi
nnoremap td  :tabclose<CR>

set pastetoggle=<F3>

" coc keymaps
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
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

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
	call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
	call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)

"=========================
" === misc plugin setup ==
" ========================
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:UltiSnipsExpandTrigger = '<f5>'

let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
"======================
"=== Latex settings ===
"======================
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : './build'
        \}

let g:tex_flavor = 'latex'
"============== 
"=== python ===
"==============
" let g:syntastic_python_checkers = ['pylint']

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
"================================
"=== Spell Checker / texidote ===
"================================
let g:vimtex_grammar_textidote = {
            \ 'jar': '/opt/textidote/textidote.jar',
            \ 'args': '--check en_UK',
            \}
let g:vimtex_grammar_vlty = {
            \'lt_directory': '/home/yousof/code/latex/LanguageTool-5.1',
            \ 'server': 'my',
            \}
