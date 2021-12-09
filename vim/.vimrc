syntax on

set noerrorbells
set tabstop=4
set shiftwidth=4
set incsearch
set autoindent
set cindent
set expandtab
set hlsearch
set clipboard=unnamedplus

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" filetype plugin on
autocmd FileType verilog setlocal expandtab
autocmd FileType verilog setlocal tabstop=2
autocmd FileType verilog setlocal shiftwidth=2
autocmd FileType systemverilog setlocal expandtab
autocmd FileType systemverilog setlocal tabstop=2
autocmd FileType systemverilog setlocal shiftwidth=2
autocmd FileType stata setlocal filetype=tcl

" Key remapping for useful commands
map <F6> :Explore<CR>
nnoremap <C-t><C-u> :UndotreeToggle<CR>
nnoremap <C-o><C-o> :vsplit<CR>
nnoremap <C-e><C-e> :split<CR>
nnoremap <C-g><C-g> :b# <bar> :bd#<CR>
nnoremap <C-f><C-f> :q<CR>
nnoremap <C-t><C-t> :NERDTreeToggle<CR>
nnoremap <C-h><C-i> :res +5<CR>
nnoremap <C-h><C-d> :res -5<CR>
nnoremap <C-v><C-i> :vertical resize +5<CR>
nnoremap <C-v><C-d> :vertical resize -5<CR>

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%96v.\+/
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


" vim-plug stuff
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'mbbill/undotree'
    Plug 'nachumk/systemverilog.vim'
	Plug 'morhetz/gruvbox'
call plug#end()

" Setting up gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
set background=dark


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


