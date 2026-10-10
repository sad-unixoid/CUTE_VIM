"	                                             __
"	_____   __  __  _______  _____       __  __ /\_\    ___ ___
"	/\  __\ /\ \/\ \/\__  __\/\  _ \     /\ \/\ \\/\ \  / __` __`\
"	\ \ \___\ \ \_\ \__/\ \_/\ \ \\/_    \ \ \_\ \\ \ \/\ \/\ \/\ \
"  \ \____\\ \_____\ \ \_\  \ \____\    \ \____/ \ \_\ \_\ \_\ \_\
"   \_____/ \/_____/  \/_/   \/____/     \/___/   \/_/\/_/\/_/\/_/
"

colorscheme 256_noir

let ayucolor="dark"

augroup TransparentBg
  autocmd!
  autocmd ColorScheme * hi Normal ctermbg=none guibg=NONE
augroup END

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'SirVer/ultisnips'
  Plug 'mhinz/vim-startify'
  Plug 'honza/vim-snippets'
  Plug 'rhysd/vim-clang-format'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ayu-theme/ayu-vim'
  Plug 'KabbAmine/vCoolor.vim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'nordtheme/vim'
  Plug 'rhysd/vim-clang-format'
  Plug 'mcgain/vim-compiler'
  Plug 'powerman/vim-plugin-ruscmd'
  Plug 'tpope/vim-commentary'
  Plug 'preservim/tagbar'
call plug#end()


" ============================================================
" ===========================STARTIFY=========================
" ============================================================
let g:startify_custom_header = startify#center([
      \' ',
      \' ',
      \'  ╔═══════════════════════════════════════════════════════════════════════════╗',
      \'   ║                                                  __                     ║',
      \'   ║      _____   __  __  _______ _____       __  __ /\_\    ___ ___         ║',
      \'   ║     /\  __\ /\ \/\ \/\__  __\\  _ \     /\ \/\ \\/\ \  / __` __`\       ║',
      \'   ║     \ \ \___\ \ \_\ \/_/\ \_/ \ \\/_    \ \ \_\ \\ \ \/\ \/\ \/\ \      ║',
      \'   ║      \ \____\\ \_____\ \ \_\ \ \____\    \ \____/ \ \_\ \_\ \_\ \_\     ║',
      \'   ║       \/____/ \/_____/  \/_/  \/____/     \/___/   \/_/\/_/\/_/\/_/     ║',
      \'   ║                                                                         ║ ',
      \'  ╚═══════════════════════════════════════════════════════════════════════════╝',
      \])

function! s:gitModified()
  let files = systemlist('git ls-files -m 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
  let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction


let g:startify_bookmarks = [
      \ { 'c': '~/.vimrc' },
      \ { 'g': '~/projects' },
      \ { 'd': '~/Documents/' },
      \ ]

let g:startify_session_autoload = 1
"let g:startify_bookmarks = [
      \ { 'i': '~/.vimrc' },
      \ { 't': '~/projects' }
      \]

" highlight current line
au WinLeave * set nocursorline 
au WinEnter * set cursorline 
set cursorline 

syntax on
syntax enable
filetype plugin indent on

set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set noswapfile

set smartindent
set cindent
set showcmd
set showmatch
set foldmethod=syntax
set foldlevelstart=99
set list
set listchars=tab:>>-

set ignorecase
set hlsearch
set incsearch
set scrolloff=4
set clipboard=unnamedplus


"autocmd BufWritePre * :%s/\s\+$//e


" ============================================================
" ======================plug setting==========================
" ============================================================

let g:airline_theme='base16_ashes'
let g:ale_cpp_clang_tidy_options = '-checks=*'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra -Werror'

filetype plugin indent on

nnoremap <F9> :w<CR>:make<CR>
nnoremap <F10> :!./%<<CR>
nnoremap <F11> :copen<CR>
nnoremap <F12> :cclose<CR>

"=========================clang-format========================
let g:clang_format_style="file"
nnoremap <leader>cf :ClangFormat<CR>

"=========================matchup========================

let g:matchup_matchparen_offscreen = {'method': 'popup'}

"==========================ultisnips==========================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"===========================rainbow===========================
let g:rainbow_active = 1
let g:rainbow_load_separately = [
      \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
      \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
      \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
      \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
      \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"===========================NerdTREE==========================
"autocmd VimEnter * NERDTree

"===========================coc-vim===========================
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

"inoremap (INPUT MODE)"
inoremap ({ ()<Space>{}<Left><Enter><Esc>O
inoremap #I #include<Space><><Left>
inoremap {{ {}<left><Enter><Esc>O
inoremap [[ []<Left>
xnoremap p "_dP 

"nnoremap (NORMAL MODE)"
nnoremap cd diwi
nnoremap ca vbdi

nmap <leader>n :NERDTreeFocus<CR>
nmap <C-n> :NERDTreeFind<CR>

nnoremap <Space><Space> :noh<CR>diwi
nnoremap <Space> :noh<CR>

nnoremap <C-F2> :e ~/.vimrc<CR>
nnoremap <C-F3> :e ~/.config/i3/config

nnoremap <c-f> :ClangFormat<CR>

nnoremap <Space>n :tabnew<CR>
nnoremap <Space>w :tabclose<CR>
nnoremap <Space>o :tabnext<CR>
nnoremap <Space>i :tabprevious<CR>
