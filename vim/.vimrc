syntax on
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set showcmd
set expandtab
set smartindent
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
set colorcolumn=80
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set cursorline
:nmap <F1> <nop>

" Copy to clipboard
vmap <C-c> :!xclip -f -sel clip<CR>

call plug#begin('~/.vim/plugged') 

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'neoclide/coc.nvim', {'branch': 'release'} " CoC for Completion
Plug 'mbbill/undotree' "Simple Undotree (yes that's the name of it)
Plug 'vim/killersheep' "Silly game :KillKillKill to play
Plug 'preservim/nerdtree' "File tree
Plug 'tpope/vim-commentary' "Comment
"fzf fuzzy finder
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Lightline
set laststatus=2
set noshowmode

" leaderkey mapped to space
let mapleader = " "

" use <tab> for trigger completion and navigate to the next complete item
" in CoC
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" F5 to Toggle Undotree
nnoremap <F5> :UndotreeToggle<cr>

" some CoC shortcuts
nnoremap <silent> <leader>m :CocList marketplace<CR> " Open CoC marketplace

" some vim windows switching shortcuts
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" allow to scroll in the preview
set mouse=a

" File searching
nnoremap <silent> <leader>sf       :Files<CR> 
" fzf search file
nnoremap <silent> <leader>p       :NERDTreeToggle<CR> 
" Open NERDTree

"If no file specified then nvim opens with NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Leader T to toggle a terminal into vim
nnoremap <leader>t :CocCommand terminal.Destroy <CR>:CocCommand terminal.Toggle<CR>
