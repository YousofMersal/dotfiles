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

" requires neovim 5
if has('nvim-0.5')
    "telescope and popup
    Plug 'hrsh7th/vim-vsnip'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim'
    Plug 'folke/todo-comments.nvim'
    Plug 'folke/lsp-colors.nvim'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'marko-cerovac/material.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/lsp_extensions.nvim'
    Plug 'tami5/lspsaga.nvim'
    Plug 'mfussenegger/nvim-dap'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'saecki/crates.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'williamboman/nvim-lsp-installer'

    " Autocompletion framework
    Plug 'hrsh7th/nvim-cmp'
    " cmp LSP completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    " cmp Snippet completion
    Plug 'hrsh7th/cmp-vsnip'
    " cmp Path completion
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-buffer'
    " See hrsh7th other plugins for more great completion sources!

    " cheatseat and note taking
    Plug 'sudormrfbin/cheatsheet.nvim'
    " file explorer
    Plug 'kevinhwang91/rnvimr'
end




Plug 'preservim/nerdcommenter'

Plug 'justinmk/vim-sneak'

Plug 'mattn/webapi-vim'

Plug 'vim-scripts/c.vim', { 'for': 'c'}

Plug 'tpope/vim-dispatch'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'airblade/vim-gitgutter'

Plug 'ap/vim-css-color', { 'for': 'css'}

Plug 'lervag/vimtex', {'for': 'tex'} 

" airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'dawikur/base16-vim-airline-themes', {'do': 'bash ./after.sh'}

"Plug 'kaicataldo/material.vim', {'for': 'hs', 'branch': 'main' }

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" yuck support 
Plug 'elkowar/yuck.vim', { 'for': 'yuck' }
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
" Theme
"Plug 'chriskempson/base16-vim'

" git plugin
Plug 'tpope/vim-fugitive'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" AT&T assembly syntax highlightning
Plug 'Shirk/vim-gas', { 'for': 's' } 

" Haskell
Plug 'autozimu/LanguageClient-neovim', {
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

"if filereadable(expand("~/.vimrc_background"))
" source ~/.vimrc_background
"endif

" haskell theming
"let g:material_terminal_italics=1
"let g:material_theme_style = 'darker'
"au BufRead,BufNewFile *.hs colorscheme material

" === Airline ===
"let g:airline_theme='base16_material_darker'
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
" ======================
" === LanguageClient ===
"=======================
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
let g:LanguageClient_serverCommands = { 'haskell': ['haskell-language-server-wrapper', '--lsp'] }

" ====================
" === coc settings ===
"=====================

"function! s:cocActionsOpenFromSelected(type) abort
  "execute 'CocCommand actions.open ' . a:type
"endfunction

"xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
"nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
"vmap <leader>. <Plug>(coc-codeaction-selected)
"nmap <leader>. <Plug>(coc-codeaction-selected)

"inoremap <silent><expr> <TAB>
            "\ pumvisible() ? "\<C-n>" :
            "\ <SID>check_back_space() ? "\<TAB>" :
            "\ coc#refresh()

"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
    "let col = col('.') - 1
    "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"inoremap <silent><expr> <c-space> coc#refresh()

"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"function! StatusDiagnostic() abort
    "let info = get(b:, 'coc_diagnostic_info', {})
    "if empty(info) | return '' | endif
    "let msgs = []
    "if get(info, 'error', 0)
	"call add(msgs, 'E' . info['error'])
    "endif
    "if get(info, 'warning', 0)
	"call add(msgs, 'W' . info['warning'])
    "endif
    "return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
"endfunction

"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"nmap <leader>rn <Plug>(coc-rename)

"let g:coc_global_extensions = [
            "\ 'coc-actions',
            "\ 'coc-json',
            "\ 'coc-pyright',
            "\ 'coc-spell-checker',
            "\ 'coc-tsserver',
            "\ 'coc-vimtex',
            "\ 'coc-java',
            "\ 'coc-omnisharp',
            "\ ]

"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
  "nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  "inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  "inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  "vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

""NeoVim-only mapping for visual mode scroll
""Useful on signatureHelp after jump placeholder of snippet expansion
"if has('nvim')
  "vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  "vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
"endif

""Use <c-space> to trigger completion.
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-@> coc#refresh()
"endif

""Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "elseif (coc#rpc#ready())
    "call CocActionAsync('doHover')
  "else
    "execute '!' . &keywordprg . " " . expand('<cword>')
  "endif
"endfunction

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
let g:UltiSnipsExpandTrigger = '<C-tab>'

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
" === AutoCompile ===
" ===================
au filetype rust setlocal makeprg=cargo\ build
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

" new stuff to make work later

" ===================
" === Lua section ===
" ===================


lua << EOF
local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

--  -- Mappings.
  local opts = { noremap=true, silent=true }


  -- See `:help vim.lsp.*` for documentation on any of the below functions
--buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--buf_set_keymap('n', '<M-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--buf_set_keymap('n', '<space>.w', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

 -- Forward to other plugins
--  require'completion'.on_attach(client)
  end

-- get all installed servers

local lsp_installer = require("nvim-lsp-installer")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


local servers = { 'texlab' ,'pyright', 'rust_analyzer', 'tsserver', 'svelte',
                    'jsonls', 'eslint', 'bashls','sumneko_lua' }

lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
            }
        }
    server:setup(opts)
end)

--for _, lsp in ipairs(servers) do
--      nvim_lsp[lsp].setup {
--        capabilities = capabilities,
--        on_attach = on_attach,
--        flags = {
--          debounce_text_changes = 150,
--        }
--      }
--end

--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--  vim.lsp.diagnostic.on_publish_diagnostics, {
--    virtual_text = true,
--    signs = true,
--    update_in_insert = true,
--  }
--)

EOF

lua << EOF

-- tree sitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}
require('lualine').setup({
    options = {
        theme = "material-nvim"
    }
})
vim.g.material_style = "darker"

require('material').setup({
    contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
    borders = false, -- Enable borders between verticaly split windows
    popup_menu = "dark", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )
    italics = {
        comments = true, -- Enable italic comments
        keywords = false, -- Enable italic keywords
        functions = false, -- Enable italic functions
        strings = false, -- Enable italic strings
        variables = false -- Enable italic variables
    },
    contrast_windows = { -- Specify which windows get the contrasted (darker) background
        --"terminal", -- Darker terminal background
        "packer", -- Darker packer background
        "qf" -- Darker qf list background
    },
    text_contrast = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false -- Enable higher contrast text for darker style
    },
    disable = {
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },
    custom_highlights = {} -- Overwrite highlights with your own
})


require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }


require("lsp-colors").setup()
--===========
-- Lsp server
-- ==========

-- rust stuff
-- See https://github.com/simrat39/rust-tools.nvim#configuration

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local opts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require'lspconfig'.bashls.setup{}
require('rust-tools').setup(opts)
require('crates').setup()
saga = require 'lspsaga'
saga.init_lsp_saga()
EOF

" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>


"find
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" Quick-fix / code action
nnoremap <silent><leader>.w <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>.w :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
"hover_doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
"signature help
nnoremap <silent> <M-K> <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
"rename
nnoremap <silent>rn <cmd>lua require('lspsaga.rename').rename()<CR>
"definition preview
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" show
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" nvim-cmp
lua << EOF
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" Avoid showing extra messages when using completion
set shortmess+=c
" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Show diagnostic popup on cursor hover

" autocmd CursorHold * lua require'lspsaga.diagnostic'.show_cursor_diagnostics()
"
" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
" use <Tab> as trigger keys
"imap <Tab> <Plug>(completion_smart_tab)
"imap <S-Tab> <Plug>(completion_smart_s_tab)

" Enable type inlay hints
"autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }
autocmd FileType toml lua require('cmp').setup.buffer { sources = { { name = 'crates' } } }

colorscheme material
