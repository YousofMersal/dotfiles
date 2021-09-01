" ==================================================================
" ====			PLUG-IN SETUP & INSTALL			====
" ==================================================================
" Install vim-plug if not found
if has('nvim')
    if empty(glob('~/.vim/autoload/plug.vim'))
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
               https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif
else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"call plug#begin('~/.vim/plugged')
if has('nvim')
    call plug#begin(stdpath('data') . '/plugged')
else
    call plug#begin('~/.vim/plugged') 
endif

""test

" requires neovim 5
if has('nvim-0.5')
    "telescope and popup
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim'
    Plug 'folke/todo-comments.nvim'

    " cheatseat and note taking
    Plug 'sudormrfbin/cheatsheet.nvim'
    Plug 'oberblastmeister/neuron.nvim'
    " file explorer
    Plug 'kevinhwang91/rnvimr'
end

Plug 'justinmk/vim-sneak'

Plug 'mattn/webapi-vim'

Plug 'vim-scripts/c.vim', { 'for': 'c'}

Plug 'tpope/vim-dispatch'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown'  }

Plug 'airblade/vim-gitgutter'

Plug 'ap/vim-css-color', { 'for': 'css'}

Plug 'lervag/vimtex', {'for': 'tex'} 

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dawikur/base16-vim-airline-themes', {'do': 'bash ./after.sh'}

Plug 'kaicataldo/material.vim', {'for': 'hs', 'branch': 'main' }

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Theme
Plug 'chriskempson/base16-vim'

" git plugin
Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" AT&T assembly syntax highlightning
Plug 'Shirk/vim-gas', { 'for': 's' } 

" Haskell
Plug 'autozimu/LanguageClient-neovim', {
    \ 'for': ['haskell'],
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }

"rust plugin
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rhysd/vim-clang-format'

"C++ plugins
Plug 'jackguo380/vim-lsp-cxx-highlight', {'for': 'cpp'}
Plug 'vim-syntastic/syntastic'
Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp']}

Plug 'ryanoasis/vim-devicons'

Plug  'neovimhaskell/haskell-vim', 

Plug 'mcchrish/nnn.vim'
" Initialize plugin system
call plug#end()
" ----------------------------------------------------------------------------------------
" set guifont=FiraCode\ Nerd\ Font 
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader=" "

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

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

" haskell theming
let g:material_terminal_italics=1
let g:material_theme_style = 'darker'
au BufRead,BufNewFile *.hs colorscheme material

" === Airline ===
let g:airline_theme='base16_material_darker'
let g:airline_experimental = 0

" ===================
" === Rust Config ===
" ===================
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rustfmt_clup_command = 'clip - selection clipboard'

" ==================
" === C++ Config ===
" ==================
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <Leader>f :<C-u>ClangFormat<CR>

" ===========================
" === General Nvim config ===
" ===========================
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'rust', 'haskell', 'c', 'cpp']

set autoindent
set timeoutlen=300
set encoding=utf-8
set number relativenumber
set encoding=UTF-8
set noshowcmd
set clipboard=unnamed
set expandtab
set shiftwidth=4
set nowrap
set nocursorline
set hidden
set cmdheight=1
set updatetime=300
set encoding=utf-8
let g:sneak#s_next = 1

" Sane splits
set splitright
set splitbelow

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

filetype plugin indent on
syntax on

"Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" syntax
"au BufRead,BufNewFile *.s set filetype=gas"

"================
"====Keybinds====
"================
" Toggle terminal on/off (neovim)
nnoremap <C-m> :make -j12<CR>
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

nnoremap <C-c> <silent> <C-c>
nnoremap <C-K> :update<cr>
inoremap <C-K> <Esc>:update<cr>gi
nnoremap td  :tabclose<CR>

" Jump to start and end of line using the home row keys
map H ^
map L $

set pastetoggle=<F3>

" ====================
" === coc settings ===
"=====================

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

"xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
"nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
vmap <leader>. <Plug>(coc-codeaction-selected)
nmap <leader>. <Plug>(coc-codeaction-selected)

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

let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-json',
            \ 'coc-pyright',
            \ 'coc-spell-checker',
            \ 'coc-tsserver',
            \ 'coc-vimtex',
            \ 'coc-java',
            \ 'coc-rust-analyzer',
            \ 'coc-omnisharp',
            \ ]

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" =============
" ==== nnn ====
" =============
nnoremap <silent> <leader>n :NnnPicker %:p:h<CR>
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.8, 'highlight': 'Title', 'border': 'rounded' } }
let g:nnn#action = {
      \ '<s-t>': 'tab split',
      \ '<s-s>': 'vsplit',
      \ '<c-v>': 'split' }
"let g:nnn#replace_netrw = 1

"=========================
" === misc plugin setup ==
" ========================
let g:UltiSnipsExpandTrigger = '<f5>'

let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:chezmoi = "enabled"
"======================
"=== Latex settings ===
"======================
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : './build'
        \}

let g:tex_flavor = 'latex'
autocmd BufRead *.tex set filetype=tex

"============== 
"=== python ===
"==============
" let g:syntastic_python_checkers = ['pylint']

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

"=============== 
"=== Haskell ===
"===============
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
let g:LanguageClient_serverCommands = { 'haskell': ['haskell-language-server-wrapper', '--lsp'] }

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
let g:vimtex_quickfix_enabled = 0
"================
"=== terminal ===
"================
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
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
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" ============
" === rasi ===
" ============
au BufNewFile,BufRead /*.rasi setf css


" ============
" === fzf ===
" ============
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" ================
" === MarkDown ===
" ================
nmap <leader>m <Plug>MarkdownPreviewToggle
let g:mkdp_browser = 'firefox'
let g:mkdp_auto_start = 0

" ===================
" === nvim-ranger ===
" ===================
if has('nvim-0.5')
    tnoremap <silent> <C-space> <C-\><C-n>:RnvimrResize<CR>
    nnoremap <silent> <c-n> :RnvimrToggle<CR>
    tnoremap <silent> <c-n> <C-\><C-n>:RnvimrToggle<CR>
    let g:rnvimr_hide_gitignore = 1
    let g:rnvimr_enable_ex = 1       
    let g:rnvimr_enable_picker = 1
    let g:rnvimr_enable_bw = 1
    highlight link RnvimrNormal CursorLine
endif

" ===================
" === Lua section ===
" ===================
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
