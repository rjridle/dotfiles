syntax on

set encoding=utf-8
set fileencoding=utf-8
set noerrorbells
set tabstop=4
set shiftwidth=4
set incsearch
set autoindent
" Enables automatic C program indenting
set cindent
" Uses spaces to insert a <Tab>
set expandtab
" Highlight searched text
set hlsearch
" Show line numbers
set number
" Allows text yanked in visual mode to be pasted
" in other files
set clipboard=unnamedplus
" set t_u7=  keeps vim from opening in replace mode
set t_u7= 

" Adds a grey column halfway across a 1920x1080 screen
set colorcolumn=114
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Key remapping for useful commands
map <F6> :Explore<CR>

" Toggle file tree
nnoremap <C-t><C-t> :NERDTreeToggle<CR> 

" Toggle undo tree
nnoremap <C-t><C-u> :UndotreeToggle<CR>

" Split windows
nnoremap <C-o><C-o> :vsplit<CR>
nnoremap <C-e><C-e> :split<CR>

" Go back/forth between buffers
nnoremap <C-l><C-l> :bn<CR>
nnoremap <C-h><C-h> :bp<CR>

" Resize splits
nnoremap <C-v><C-i> :res +5<CR>
nnoremap <C-v><C-d> :res -5<CR>
nnoremap <C-h><C-i> :vertical resize +5<CR>
nnoremap <C-h><C-d> :vertical resize -5<CR>

" Deleting buffers
nmap <C-f><C-f> <Plug>Kwbd

" doesn't close buffer if open
" in multiple windows
let bclose_multiple = 0

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" vim-plug stuff
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'mbbill/undotree'
    Plug 'dense-analysis/ale'
	Plug 'morhetz/gruvbox'
    Plug 'chrisbra/unicode.vim'
call plug#end()

" Jump to last position when reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
     \| exe "normal! g'\"" | endif
endif

" Setting up persistent undo to work with undotree
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" ALE linter for SystemVerilog
au FileType systemverilog
\ let g:ale_linters = {'systemverilog' : ['verilator'],}
let g:ale_verilog_verilator_options='-sv --default-language "1800-2017"'

" ALE linter for VHDL
au FileType vhdl
\ let g:ale_linters = {'vhdl' : ['ghdl'],}
let g:ale_vhdl_ghdl_options='--std=08'

" filetype plugin on
autocmd FileType verilog setlocal expandtab
autocmd FileType verilog setlocal tabstop=2
autocmd FileType verilog setlocal shiftwidth=2
autocmd FileType systemverilog setlocal expandtab
autocmd FileType systemverilog setlocal tabstop=2
autocmd FileType systemverilog setlocal shiftwidth=2
autocmd FileType stata setlocal filetype=tcl

" Setting up gruvbox
set background=dark
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
