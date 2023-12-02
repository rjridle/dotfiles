syntax on

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set t_u7=               " set t_u7=  keeps vim from opening in replace mode
set incsearch           " When searching will highlight the currently typed search pattern
set expandtab           " uses spaces to insert a <Tab>
set number              " show line numbers
set noerrorbells        " disables bell ringing for error messages
set cindent             " enables automatic C program indenting
set hlsearch            " highlight searched text
set autoindent          " copies indent from current line when starting a new line.
set guioptions-=m       " includes menu bar in GUI version of VIM
set guioptions-=T       " includes Toolbar in GUI version of VIM
set ignorecase          " ignore case in search patterns 
set smartcase           " overrides ignorecase iif search pattern contains upper case chars
set modeline            " gives # of lines that is checked for set commands
set cinoptions=11       " affects way 'ciindent' reindents lines in a C program
set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamedplus " allows text yanked in visual mode to be pasted in other files


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

" Key remapping for useful commands
map <F6> :Explore<CR>

" doesn't close buffer if open
" in multiple windows
let bclose_multiple = 0

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

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

" Adds a grey column halfway across a 1920x1080 screen
set colorcolumn=114
highlight ColorColumn ctermbg=0 guibg=lightgrey

" filetype plugin on
autocmd FileType verilog setlocal expandtab
autocmd FileType verilog setlocal tabstop=2
autocmd FileType verilog setlocal shiftwidth=2
autocmd FileType systemverilog setlocal expandtab
autocmd FileType systemverilog setlocal tabstop=2
autocmd FileType systemverilog setlocal shiftwidth=2
autocmd FileType stata setlocal filetype=tcl

" vim-plug stuff
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'mbbill/undotree'
    Plug 'dense-analysis/ale'
	Plug 'morhetz/gruvbox'
    Plug 'chrisbra/unicode.vim'
call plug#end()

" Toggle file tree
nnoremap <C-t><C-t> :NERDTreeToggle<CR> 

" Toggle undo tree
nnoremap <C-t><C-u> :UndotreeToggle<CR>


" ALE linter for SystemVerilog
au FileType systemverilog
\ let g:ale_linters = {'systemverilog' : ['verilator'],}
let g:ale_verilog_verilator_options='-sv --default-language "1800-2017" --no-timing +notimingchecks'

" ALE linter for VHDL
au FileType vhdl
\ let g:ale_linters = {'vhdl' : ['ghdl'],}
let g:ale_vhdl_ghdl_options='--std=08 -fsynopsys'

" Setting up gruvbox
set background=dark
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
