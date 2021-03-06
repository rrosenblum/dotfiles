call plug#begin('~/.local/share/nvim/plugged')
" general enhancements
Plug 'lifepillar/vim-solarized8'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'Shougo/unite.vim'
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'
Plug 'mhinz/vim-signify'
Plug 'RRethy/vim-illuminate'
Plug 'google/vim-searchindex'
Plug 'haya14busa/incsearch.vim'
Plug 'mileszs/ack.vim'
" Plug 'tpope/vim-endwise' " this interferes with snippets
Plug 'vim-scripts/YankRing.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --js-completer' }
" Plug 'SirVer/ultisnips'
Plug 'https://gitlab.com/HiPhish/awk-ward.nvim'
Plug 'joeytwiddle/vim-diff-traffic-lights-colors'

" language support
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/nvim-compe'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/vader.vim'
Plug 'ngmy/vim-rubocop'
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs.vim' " javascript syntax
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'aliou/sql-heredoc.vim'
Plug 'slim-template/vim-slim'

Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'ryanoasis/vim-devicons' " load this last. It somehow relies on other plugins already being installed to determine what support it has
call plug#end()

syntax enable
set termguicolors
set background=dark
filetype plugin indent on
compiler ruby
colorscheme solarized8

set autoread
set backspace=indent,eol,start
set backup                        " enable backups
set backupdir=~/.vim/tmp/backup// " backups
set cmdheight=2 " better coc message display
set dir=/tmp//
set directory=~/.vim/tmp/swap//   " swap files
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set nocompatible
set noshowmode
set noswapfile                    " it's 2013, Vim.
set notimeout
set number
set pastetoggle=<F2>
set rtp+=/usr/local/opt/fzf
set scrolloff=5
set smartcase
set synmaxcol=250
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ttimeout
set ttimeoutlen=10
set undodir=~/.vim/tmp/undo//     " undo files
set updatetime=300
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set fillchars+=vert:│ " use a larger vertical character so that the vertical split is a solid line
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermbg=NONE

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'

let g:ale_lint_delay = 1000
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop'],
  \}
let g:ale_linters = {
  \   'ruby': [
  \     'ruby',
  \     'rubocop',
  \   ],
  \}

let g:ackhighlight = 1
let g:ack_default_options = ' -H --nocolor --nogroup --column --ignore-dir=tmp --ignore-dir=.git --ignore-dir=.idea'
if executable('ag')
  let g:ackprg = 'ag --vimgrep --column --nogroup --noheading --hidden --nocolor --ignore-dir=tmp --ignore-dir=.git --ignore-dir=.idea'
endif

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_reuse_window = 'netrw\|NERDTree'
let g:ctrlp_max_files = 0
let g:ctrlp_lazy_update = 100
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.idea$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = 'ag %s --hidden --ignore-dir=.git --ignore-dir=.idea --ignore-dir=.hg --ignore-dir=.svn --files-with-matches -g ""'
let g:ctrlp_show_hidden = 1

let g:fzf_layout = { 'down': '~25%' }

" use `echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")` to
" determine the highlight-group of the word under the cursor
let g:Illuminate_ftHighlightGroups = {
      \ 'vim': [
      \         'vimVar', 'vimString', 'vimLineComment', 'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc'
      \        ],
      \ 'ruby': [
      \          'Constant', 'Define', 'Function', 'PreProc', 'rubyInstanceVariable', 'rubyArrayLiteral', 'rubyBlock',
      \          'rubyBlockParameterList', 'rubyConditionalExpression', 'rubyCurlyBlock', 'rubyDoBlock',
      \          'rubyMethodBlock', 'Type', 'rubyRepeatExpression', 'rubyOptionalDoLine', 'rubyCaseExpression',
      \          'rubyBangPredicateMethod', 'rubyAssertion', 'rubyClassBlock'
      \         ]
      \ }

let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1

let g:ruby_indent_block_style = 'do'

let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop'

let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
let g:unite_source_grep_recursive_opt = '-R'

let test#strategy = 'vimux'

call unite#filters#matcher_default#use(['matcher_fuzzy'])
" incsearch mappings
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

let mapleader = " "
map <Leader>aw :Ack! '<C-R><C-W>'
map <silent> <Leader>nt :NERDTreeToggle<CR>
map <silent> <Leader>nf :NERDTreeFind<CR>
map <silent> <Leader>ff :CtrlP<CR>
map <silent> <Leader>fb :CtrlPBuffer<CR>
map <silent> <Leader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>
map <silent> <Leader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <Leader>ra :RuboCop -a<CR>
map <silent> <Leader>af :ALEFix<CR>
map <silent> <Leader>tn :wa<CR> :TestNearest<CR>
map <silent> <Leader>tl :wa<CR> :TestLast<CR>
map <silent> <Leader>tf :wa<CR> :TestFile<CR>
map <silent> <Leader>tv :wa<CR> :TestVisit<CR>
map <silent> <Leader>yr :YRShow<CR>
nnoremap <silent> <Leader><CR> :tabe<CR>
nnoremap <silent> <Leader>[ :tabp<CR>
nnoremap <silent> <Leader>] :tabn<CR>
nnoremap <silent> <Leader>rr :set relativenumber!<cr>
nnoremap <silent> <Leader>tb :Tagbar<cr>
nnoremap <leader>uf :<C-u>Unite file_rec<CR>
nnoremap <leader>uaf :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> <leader>ub :<C-u>Unite buffer bookmark<CR>
inoremap jj <ESC>
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif
" Read a pdf as text
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
"inoremap <Tab> <C-p>

" Change Ag to Ack
cnoreabbrev Ag Ack

" treat wrapped lines as their own lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

"select displayed lines using shift + home/end/arrow-keys
noremap <buffer> <silent> <S-Home> vg<Home>o<S-Right>o
noremap <buffer> <silent> <S-End> vg<End>
noremap <buffer> <silent> <S-Up> vgk
noremap <buffer> <silent> <S-Down> vgj
inoremap <buffer> <silent> <S-Home> <C-o>vg<Home>o<S-Right>o
inoremap <buffer> <silent> <S-End> <C-o>vg<End>
inoremap <buffer> <silent> <S-Up> <C-o>vgk
inoremap <buffer> <silent> <S-Down> <C-o>vgj

lua << EOF
local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
    luasnip = false,
    buffer = true,
    calc = false,
    nvim_lua = false,
    vsnip = true,
    ultisnips = false,
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- local vsnip = require('vim-vsnip')
-- Use (s-)tab to:
--- move to prev/next item in completion menu
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  else
    return t '<S-Tab>'
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.solargraph.setup{
  -- on_attach=require'completion'.on_attach;
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    solargraph = {
      diagnostics = true;
      formatting = true;
    }
  }
}

nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert'
EOF

autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead Jenkinsfile set ft=groovy

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
nnoremap <silent> <Leader>ww :%s/\s\+$//<CR>:let @/=''<CR><C-o>
highlight clear SignColumn
highlight SignifySignAdd    cterm=bold ctermfg=119
highlight SignifySignDelete cterm=bold ctermfg=167
highlight SignifySignChange cterm=bold ctermfg=227

autocmd FocusLost * stopinsert
autocmd VimResized * :wincmd = " auto resize vim when the window is resized

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

source ~/.config/nvim/nyan.vim
