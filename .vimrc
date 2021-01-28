
"----------------------------------------------------------------
"            _
"     _   __(_)___ ___  __________
"    | | / / / __ `__ \/ ___/ ___/
"   _| |/ / / / / / / / /  / /__
"  (_)___/_/_/ /_/ /_/_/   \___/
"
"----------------------------------------------------------------


"--------------------------------------------
" Plugins (vim-plug)
" -------------------------------------------

call plug#begin('~/.vim/plugged')

" Plugins go here
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'valloric/matchtagalways'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ying17zi/vim-live-latex-preview'
Plug 'elixir-editors/vim-elixir'
Plug 'tmhedberg/SimpylFold'
Plug 'w0rp/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'majutsushi/tagbar'

call plug#end()

"--------------------------------------------
" Editing
" -------------------------------------------
set nocompatible              " be iMproved, required

set number
set termguicolors
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complet

" Don't try to be vi compatible
set nocompatible

" Turn on syntax highlighting
syntax enable

" For plugins to load correctly
filetype plugin indent on

let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

"clear search 
map <leader><space> :let @/=''<cr> 

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Split
set splitbelow

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Automatically read file when changed from outside
set autoread

" Show docstring when folded
let g:SimpylFold_docstring_preview=1

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" CTAGS
set tags=tags;/

" Auto close parenthesis etc.
inoremap " ""<left>
inoremap ' ''<left>
inoremap < <><left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"Terminal
tnoremap <leader>v <C-w>:vert term<CR>

"--------------------------------------------
" Plugins settings
" -------------------------------------------

" ----- NERDCommenter -----
let g:NERDDefaultAlign          = 'left'
let g:NERDSpaceDelims           = 1
let g:NERDCompactSexyComs       = 1
let g:NERDCommentEmptyLines     = 0
let g:NERDCreateDefaultMappings = 0
let g:NERDCustomDelimiters      = {
	\ 'python': {'left': '#'},
	\ }

nnoremap cc :call NERDComment(0,'toggle')<CR>
vnoremap cc :call NERDComment(0,'toggle')<CR>

" ----- NERDTree----- 
" Removes error variable g:NERDtreeNodeDelimiter is not defined 
let g:NERDTreeNodeDelimiter = "\u0009" 

nnoremap <silent> <C-n> :call <SID>ToggleNERDTree()<CR>

" Tagbar toggle (custom function)
nnoremap <silent> <C-t> :call <SID>ToggleTagbar()<CR>
let g:tagbar_autofocus        = 1
let g:tagbar_show_linenumbers = 2
let g:tagbar_sort             = 0

" ----- Coc -----
" Scroll popup window
nnoremap <expr> <c-d> Scroll_cursor_popup(1) ? '<esc>' : '<c-d>'
nnoremap <expr> <c-u> Scroll_cursor_popup(0) ? '<esc>' : '<c-u>'

" Use <c-space> to trigger completion. DOESN'T WORK
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


" ----- Airline -----
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"--------------------------------------------
" Helper functions
" -------------------------------------------

" ----- NERDTree -----
" Better toggle for NERDTree
function! s:ToggleNERDTree() abort
	if bufname('%') != ""
		if exists("g:NERDTree") && g:NERDTree.IsOpen()
			if &filetype ==# 'nerdtree'
				execute ':NERDTreeClose'
			else
				execute ':NERDTreeFocus'
			endif
		else
			execute ':NERDTreeFind'
		endif
	else
			execute ':NERDTreeToggleVCS'
	endif
endfunction

" ----- Tagbar -----
" Better toggle for Tagbar
function! s:ToggleTagbar() abort
	let tagbarwinnr = bufwinnr(s:TagbarBufName())
	if tagbarwinnr != -1
		if &modifiable
			execute tagbarwinnr 'wincmd w'
		else
			execute ':TagbarClose'
		endif
	else
		execute ':TagbarOpen'
	endif
endfunction

" Get Tagbar buffer name
function! s:TagbarBufName() abort
	if !exists('t:tagbar_buf_name')
		let s:buffer_seqno += 1
		let t:tagbar_buf_name = '__Tagbar__.' . s:buffer_seqno
	endif
	return t:tagbar_buf_name
endfunction

" ----- Coc -----
" Scroll documentation with coc
" it's necessary to test entire rect, as some popup might be quite
" small
function! Scroll_cursor_popup(down)
  let winid = Find_cursor_popup()
  if winid == 0
    return 0
  endif
  for r in range(srow - radius, srow + radius)
    for c in range(scol - radius, scol + radius)
      let winid = popup_locate(r, c)
      if winid != 0
        return winid
      endif
    endfor
  endfor

  return 0
endfunction


function! Find_cursor_popup(...)
let radius = get(a:000, 0, 2)
let srow = screenrow()
let scol = screencol()
let pp = popup_getpos(winid)
call popup_setoptions(winid,
      \ {'firstline': pp.firstline + ( a:down ? 1 : -1) } )

return 1
endfunction

" Show documentation with coc using 'K'
function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
   execute 'h '.expand('<cword>')
 elseif (coc#rpc#ready())
   call CocActionAsync('doHover')
 else
   execute '!' . &keywordprg . " " . expand('<cword>')
 endif
 endfunction

"--------------------------------------------
" Fileextension specifics
" -------------------------------------------

" LaTex
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a qpdfview'
set path+=/bin

" Python
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix |
let python_highlight_all=1


"--------------------------------------------
" Colorschemes
" -------------------------------------------

" Color scheme (terminal)
set background=dark
set t_Co=256
let g:gruvbox_termcolors=256
let g:gruvbox_termtrans=1
let g:gruvbox_italic=1
colorscheme gruvbox

if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ 10
  colorscheme solarized
  set background=dark
endif
