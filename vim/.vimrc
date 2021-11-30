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

map <F6> :Explore<CR>


autocmd FileType verilog setlocal expandtab
autocmd FileType verilog setlocal tabstop=2
autocmd FileType verilog setlocal shiftwidth=2
autocmd FileType systemverilog setlocal expandtab
autocmd FileType systemverilog setlocal tabstop=2
autocmd FileType systemverilog setlocal shiftwidth=2
autocmd FileType stata setlocal filetype=tcl

" filetype plugin on

" vim-plug stuff
call plug#begin()
    Plug 'mbbill/undotree'
    Plug 'nachumk/systemverilog.vim'
	Plug 'morhetz/gruvbox'

" On-demand loading
"   Plug 'plugin/here', { 'on': 'NERDTreeToggle' }
call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
set background=dark


nnoremap <SPACE>u :UndotreeToggle<CR>
nnoremap <C-o><C-o> :vsplit<CR>
nnoremap <C-e><C-e> :split<CR>
nnoremap <C-g><C-g> :b# <bar> :bd#<CR>
nnoremap <C-f><C-f> :q<CR>


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

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%96v.\+/

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

