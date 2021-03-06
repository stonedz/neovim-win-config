"" My custom neovim init. Mainly based on Optixal/neovim-init.vim
"" Notes at the end of the file

call plug#begin('~/AppData/Local/nvim/plugged')
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'bryanmylee/vim-colorscheme-icons'
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'junegunn/vim-journal'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'nightsense/forgotten'
    Plug 'zaki/zazen'

    " Aethetics - Additional
    Plug 'nightsense/nemo'
    Plug 'yuttie/hydrangea-vim'
    Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
    Plug 'rhysd/vim-color-spring-night'

    " Functionalities
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'majutsushi/tagbar'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mhinz/vim-signify'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-abolish'
    Plug 'Yggdroot/indentLine'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'chrisbra/Colorizer'
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
    Plug 'vim-scripts/loremipsum'
    Plug 'metakirby5/codi.vim'
    Plug 'dkarter/bullets.vim'
    Plug 'psliwka/vim-smoothie'
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'wellle/context.vim'

    """"""""
    ""Paolo
    """"""""
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'andymass/vim-matchup'
    "Linter, gets info from Coc
    Plug 'dense-analysis/ale'
    Plug 'arcticicestudio/nord-vim'
    Plug 'morhetz/gruvbox'

    "close buffers without closing nvim
    Plug 'moll/vim-bbye'
    "debugger integration
    Plug 'vim-vdebug/vdebug'

    "php
    Plug 'StanAngeloff/php.vim'
    Plug 'stephpy/vim-php-cs-fixer'

    "snippets
    Plug 'honza/vim-snippets'
    Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
    call plug#end()

    filetype plugin indent on
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
    set incsearch ignorecase smartcase hlsearch
    set wildmode=longest,list,full wildmenu
    set ruler laststatus=2 showcmd showmode
    set fillchars+=vert:\ 
    set wrap breakindent
    set encoding=utf-8
    set textwidth=0
    set hidden
    set number relativenumber
    set title

    " Functions and autocmds to run whenever changing colorschemes
    function! TransparentBackground()
        highlight Normal guibg=NONE ctermbg=NONE
        highlight LineNr guibg=NONE ctermbg=NONE
        set fillchars+=vert:\?
        highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
    endfunction

    function! DraculaPMenu()
        highlight Pmenu guibg=#363948
        highlight PmenuSbar guibg=#363948
    endfunction

    augroup MyColors
        autocmd!
        autocmd ColorScheme dracula call DraculaPMenu()
        "autocmd ColorScheme * call TransparentBackground() " uncomment if you are using a translucent terminal and you want nvim to use that
    augroup END

    " Main Coloring Configurations
    syntax on
    color gruvbox

    " Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
    set termguicolors
    """ Plugin Configurations

    " NERDTree
    let NERDTreeShowHidden=1
    " Exit Vim if NERDTree is the only window left.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    "php-cs-fixer

    " If you use php-cs-fixer version 1.x
    let g:php_cs_fixer_level = "symfony"                   " options: --level (default:symfony)
    let g:php_cs_fixer_config = "default"                  " options: --config
    " If you want to define specific fixers:
    "let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers
    "let g:php_cs_fixer_config_file = '.php_cs'            " options: --config-file
    " End of php-cs-fixer version 1 config params

    " If you use php-cs-fixer version 2.x
    let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
    "let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
    "let g:php_cs_fixer_config_file = '.php_cs' " options: --config
    " End of php-cs-fixer version 2 config params

    let g:php_cs_fixer_php_path = "php"               " Path to PHP
    let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
    let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
    let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

    " Vdebug
    let g:vdebug_options = {}
    let g:vdebug_options = {'ide_key': 'vim-xdebug'}
    let g:vdebug_options = {'break_on_open': 0}
    let g:vdebug_options = {'server': '127.0.0.1'}
    let g:vdebug_options = {'port': '9001'}
    let g:vdebug_options.path_maps = {'/var/www/html/public' : '/home/stonedz/work/ciaoflorence'}

    " Airline
    let g:airline_powerline_fonts = 1
    "let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
    let g:airline_section_warning = ''
    let g:airline#extensions#tabline#enabled = 1 " Uncomment to display buffer tabline above
    let g:airline#extensions#tabline#buffer_nr_show = 1

    " Neovim :Terminal but Esc still works to close fzf windows
    tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
    tmap <C-w> <Esc><C-w>
    "tmap <C-d> <Esc>:q<CR>
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert

    " vim-pydocstring
    let g:pydocstring_doq_path = '~/.config/nvim/env/bin/doq'

    " Supertab
    let g:SuperTabDefaultCompletionType = "<C-n>"

    " EasyAlign
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)

    " indentLine
    let g:indentLine_char = '|'
    let g:indentLine_defaultGroup = 'NonText'
    " Disable indentLine from concealing json and markdown syntax (e.g. ```)
    let g:vim_json_syntax_conceal = 0
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_conceal_code_blocks = 0

    " TagBar
    let g:tagbar_width = max([25, winwidth(0) / 5])

    " fzf-vim
    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'Type'],
      \ 'border':  ['fg', 'Constant'],
      \ 'prompt':  ['fg', 'Character'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

    " Bat theme for syntax coloring when viewing files in fzf
    let $BAT_THEME='base16'

    " Limelight
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_guifg = 'gray'

    " Startify
    let g:startify_fortune_use_unicode = 1

    " Startify + NERDTree on start when no file is specified
    autocmd VimEnter *
        \   if !argc()
        \ |   Startify
        \ |   NERDTree
        \ |   wincmd w
        \ | endif


    ""let Coc manage the linting
    ""also add "diagnostic.displayByAle": true in you :CocConfig
    let g:ale_disable_lsp = 1


" coc.vim START

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

""PHP

if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif

"Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cfs  <Plug>(coc-format-selected)
nmap <leader>cfs  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" coc.vim END

" signify
let g:signify_sign_add = '|'
let g:signify_sign_delete = '|'
let g:signify_sign_change = '|'
hi DiffDelete guifg=#ff5555 guibg=none

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" context.vim
let g:context_nvim_no_redraw =1
let g:python3_host_prog="/usr/bin/python"

"" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme='dracula'
    color dracula
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorSeoul256()
    let g:airline_theme='silver'
    color seoul256
endfunction

" Forgotten Mode (Light)
function! ColorForgotten()
    " Other light airline themes: tomorrow, silver, alduin
    let g:airline_theme='tomorrow'
    " Other light colors: forgotten-light, nemo-light
    color forgotten-light
endfunction

" Zazen Mode (Black & White)
function! ColorZazen()
    let g:airline_theme='minimalist'
    color zazen
endfunction

"if has("win32")
"set shell=bash.exe
"set shellpipe=|
"set shellredir=>
"set shellcmdflag =
"endif

""" Custom Mappings

let mapleader=","
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>
"NERDTREE
nmap <leader>nt :NERDTree %:p:h<CR>
nmap \\ :NERDTreeToggle<CR>
nmap <leader>w :TagbarToggle<CR>
nmap \| <leader>w

nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme 
nmap <leader>e1 :call ColorDracula()<CR>
nmap <leader>e2 :call ColorSeoul256()<CR>
nmap <leader>e3 :call ColorForgotten()<CR>
nmap <leader>e4 :call ColorZazen()<CR>

if has("unix")
    nmap <leader>r :so ~/.config/nvim/init.vim<CR>
elseif
    nmap <leader>r :so C:\Users\paolo\AppData\Local\nvim\init.vim<CR>
endif

nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>s :Rg<CR>
nmap <leader>dd :Files<CR>
nmap <leader>ff :BLines<CR>
nmap <leader>fa :Lines<CR>
nmap <leader>f :Ag<CR> 
nmap <leader>g :Goyo<CR>

nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

""Movement between splits.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close current buffer
map <leader>bd :Bclose<cr>

" Close all buffers
map <leader>ba :1,1000 bd!<cr>

""Switch CWD to the directory of the open buffer:"
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"Surrond the visual selection in parenthesis
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

"vim-bbeye close buffer without closing main window
nmap <leader>qw :Bdelete<cr>
nmap <leader>qq :Bwipeout<cr>

"vim-php-cs-fizer
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

""Make project with build, run, debug executable files in CWD
nmap <leader><F2> :!build<CR>
nmap <leader><F3> :!run<CR>
nmap <leader><F4> :!debutg<CR>



""""""""""
""NOTES
""""""""""
" * Install neovim python3 python3-pip git curl ctags
" * pip install wheel yapf pynvim
" * Install node
" * Install silversearcher-ag ripgrep
" * Install vim-plug
"   * curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
" * ensure to copy CocSettings from coc-settings.json
"
" PHP
" * CocInstall coc-phpls
" * npm -g i intelephense
" * optionally add license key in CocConfig
"    * "intelephense.licenceKey": "LICENSE"
" * install php-cs-fixer globally
"   * wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer
"   * sudo chmod a+x php-cs-fixer
"   * sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer
"
" PHP debug
" * install xdebug
" * confiure xdebug port 9000 vim-xdebug ide_key
" * for xdebug 3 refer to https://xdebug.org/docs/upgrade_guide
"
" CSS
" * CocInstall coc-css
" * npm install --save vscode-css-languageservice
