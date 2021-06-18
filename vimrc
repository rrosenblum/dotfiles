call plug#begin('~/.local/share/nvim/plugged')
" general enhancements
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
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/YankRing.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --js-completer' }
" Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'https://gitlab.com/HiPhish/awk-ward.nvim'
Plug 'joeytwiddle/vim-diff-traffic-lights-colors'

" language support
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

Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'ryanoasis/vim-devicons' " load this last. It somehow relies on other plugins already being installed to determine what support it has
call plug#end()

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

syntax enable
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
filetype plugin indent on
compiler ruby
colorscheme slate

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

set fillchars+=vert:│
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
      \          'rubyMethodBlock', 'Type'
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

" coc configurations
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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

highlight ALEError ctermbg=Grey ctermfg=Black
highlight ALEWarning ctermbg=Grey ctermfg=Black
highlight Search ctermbg=Grey ctermfg=Black

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

function! NyanMe()
    hi NyanFur             guifg=#BBBBBB
    hi NyanPoptartEdge     guifg=#ffd0ac
    hi NyanPoptartFrosting guifg=#fd3699 guibg=#fe98ff
    hi NyanRainbow1        guifg=#6831f8
    hi NyanRainbow2        guifg=#0099fc
    hi NyanRainbow3        guifg=#3cfa04
    hi NyanRainbow4        guifg=#fdfe00
    hi NyanRainbow5        guifg=#fc9d00
    hi NyanRainbow6        guifg=#fe0000

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanFur
    echon "╰"
    echohl NyanPoptartEdge
    echon "⟨"
    echohl NyanPoptartFrosting
    echon "⣮⣯⡿"
    echohl NyanPoptartEdge
    echon "⟩"
    echohl NyanFur
    echon "⩾^ω^⩽"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echon " "
    echohl NyanFur
    echon "”   ‟"
    echohl None

    sleep 1
    redraw
    echo " "
    echo " "
    echo "Noms?"
    redraw
endfunction
command! NyanMe call NyanMe()
