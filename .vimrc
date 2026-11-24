"	                                              __
"	 _____   __  __  _______  _____       __  __ /\_\    ___ ___
"	/\  __\ /\ \/\ \/\__  __\/\  _ \     /\ \/\ \\/\ \  / __` __`\
"	\ \ \___\ \ \_\ \__/\ \_/\ \ \\/_    \ \ \_\ \\ \ \/\ \/\ \/\ \ 
"    \ \____\\ \_____\ \ \_\  \ \____\    \ \____/ \ \_\ \_\ \_\ \_\
"     \_____/ \/_____/  \/_/   \/____/     \/___/   \/_/\/_/\/_/\/_/
"

colorscheme catppuccin 

let g:NERDTreeGitStatusWithFlags = 1
highlight Normal ctermbg=None
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" augroup TransparentBg
" autocmd VimEnter * belowright terminal ++rows=4
" augroup END

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'SirVer/ultisnips'
  Plug 'mhinz/vim-startify'
  Plug 'honza/vim-snippets'
  Plug 'rhysd/vim-clang-format'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ayu-theme/ayu-vim'
  Plug 'KabbAmine/vCoolor.vim'
  Plug 'nordtheme/vim'
  Plug 'rhysd/vim-clang-format'
  Plug 'mcgain/vim-compiler'
  Plug 'powerman/vim-plugin-ruscmd'
  Plug 'tpope/vim-commentary'
  Plug 'preservim/tagbar'
  Plug 'morhetz/gruvbox'
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
      \ { 'g': '~/projects/' },
      \ { 'd': '~/Documents/' },
      \ { 'a': '~/iso/' },
      \ ]

let g:startify_session_autoload = 1
"let g:startify_bookmarks = [
      \ {                'i': '~/.vimrc' },
      \ {                't': '~/projects' }
      \]

" highlight current line
au WinLeave * set nocursorline 
au WinEnter * set cursorline 
set cursorline 

" syntax on
" syntax enable
" filetype plugin indent on

set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set noswapfile

set smartindent
set cindent
set showcmd
set showmatch
set foldmethod=syntax
set foldlevelstart=99
" set list
" set listchars=tab:..

set ignorecase
set hlsearch
set incsearch
set scrolloff=4
set clipboard=unnamedplus

set mouse=a
set expandtab
set laststatus=2
set statusline+=%F

"autocmd BufWritePre * :%s/\s\+$//e


" ============================================================
" ======================plug setting==========================
" ============================================================

let g:ale_cpp_clang_tidy_options = '-checks=*'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra -Werror'
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

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

nmap <C-n> :NERDTree<CR>

nnoremap <Space><Space> :noh<CR>diwi
nnoremap <Space><Esc> :noh<CR>

nnoremap <C-F2> :e ~/.vimrc<CR>
nnoremap <C-F3> :e ~/.config/i3/config

nnoremap <c-f> :ClangFormat<CR>

nnoremap <Space>n :tabnew<CR>
nnoremap <Space>w :tabclose<CR>
nnoremap <Space>o :tabnext<CR>
nnoremap <Space>i :tabprevious<CR>
nnoremap <Space>t :bel terminal<CR><C-w>18-

"java
inoremap !PP System.out.println("")<Left><Left>
inoremap !P System.out.print("")<Left><Left>
