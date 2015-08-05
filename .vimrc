let g:C_UseTool_doxygen = 'yes' 
" let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
set nocompatible              " be iMproved, required
syntax on 
" filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'gmarik/vundle' 

"File finding
" Bundle 'wincent/Command-T'
Plugin 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'a.vim'

"Syntax
Bundle 'godlygeek/tabular'
Plugin 'Shougo/neocomplete.vim'
Bundle 'Mizuchi/STL-Syntax'
Plugin 'scrooloose/syntastic'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Shougo/context_filetype.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'justinmk/vim-syntax-extra'
Plugin 'Chiel92/vim-autoformat'

"Movement
Bundle 'Lokaltog/vim-easymotion'

"UI
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'bling/vim-airline'
Bundle 'zhaocai/GoldenView.Vim'
Plugin 'altercation/vim-colors-solarized'

"Language Features
Plugin 'burnettk/vim-angular'
"Misc
Bundle 'DoxygenToolkit.vim'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'

"Testing
Bundle 'slim-template/vim-slim.git'
Plugin 'othree/html5.vim'
Plugin 'TaskList.vim'
"Bundle 'SirVer/utilsnips'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set nowrap
set expandtab
set number
set tabstop=8
set shiftwidth=3
set visualbell
set noerrorbells
set cursorline

set background=dark
colorscheme solarized
"General commands
map <Tab> :tabn<CR>
"Create a new file
map <Leader>n :new 
"Move between windows quickly
let g:goldenview__enable_default_mapping = 0
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"Move whole page
map <Up> <C-b>
map <down> <C-f>

"Refresh vimrc
map <Leader>r :so ~/.vimrc<cr>
"Copy/Paste system clipboard. Command precedes whatever copy/paste command you
"want to use
map <C-c> "*

"Open new window
nmap <silent> <C-m>  <Plug>GoldenViewSplit

"Go to last selected file
map <C-o> :bn<cr>
" map <C-p> :bp<cr>
"Allign selected lines by equal sign
vmap <C-e> :Tabularize /^[^=]*\zs=/<cr>

set tags=./tags;
" NerdTree options
 map <C-t> :NERDTreeToggle<CR>
 nmap <F7> :TagbarToggle<CR>

" Open task list
 map <F3> :TaskList<CR>
"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
     let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"
 "Easy motion
 let g:EasyMotion_smartcase = 1
 map <Leader>l <Plug>(easymotion-lineforward)
 map <Leader>j <Plug>(easymotion-j)
 map <Leader>k <Plug>(easymotion-k)
 map <Leader>h <Plug>(easymotion-linebackward)

 map / <PLUG>(easymotion-sn)
 omap / <PLUG>(easymotion-tn)
 map  n <Plug>(easymotion-next)
 map  N <Plug>(easymotion-prev)

 let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
 "multiple cursors
 " Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
let g:multi_cursor_exit_from_insert_mode = 0
"Close vim if NERD tree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"filetypes
au BufRead,BufNewFile *.tpl set filetype=smarty.html

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_php_phpcs_args='--tab-width=0'
nmap <F1> :SyntasticReset<CR>
nmap <F2> :SyntasticCheck<CR>

let g:syntastic_mode_map = {
   \"mode": "active",
   \"active_filetypes": ["php", "smarty"],
   \"passive_filetypes": ["html"]}

"Neocomplete
inoremap <expr><C-Space>        neocomplete#start_manual_complete('omni')"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#use_vimproc = 1
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
