set shell=/bin/bash

let mapleader = "\<Space>"

set rtp+=$USERPROFILE/vimfiles
set encoding=utf-8
set relativenumber
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set number
set nowrap
set hls
set ruler
set incsearch
set backspace=2
set splitbelow
highlight clear SignColumn
set signcolumn="yes"

call plug#begin('~/.local/share/nvim/plugged')
 Plug 'bling/vim-airline'
 Plug 'airblade/vim-rooter'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-sensible'
 Plug 'scrooloose/nerdtree'
 Plug 'vim-syntastic/syntastic'
 Plug 'rust-lang/rust.vim'
 Plug 'itchyny/lightline.vim'
 Plug 'junegunn/fzf'
 Plug 'junegunn/fzf.vim'
 Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'chriskempson/base16-vim'
call plug#end()

let base16colorspace=256
set background=dark
colorscheme base16-woodland
set termguicolors

imap <C-s> <ESC>:w<CR>
map! <S-Insert> <C-R>+
vmap <C-c> <C-Ins>
map <leader>n :nohl<cr>
map <leader>p "*p
nnoremap <leader>; :Buffers<cr>
nnoremap <C-T> :Files<cr>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> R :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>
imap jj <esc>

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#deoplete_omni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})

let g:LanguageClient_serverCommands = {
                 \ 'rust': ['rustup', 'run', 'stable', 'rls'],
                 \ }
let g:rustfmt_autosave = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_linters = {'rust': ['rls']}
let g:LanguageClient_autoStart = 1
let g:rooter_manual_only = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

