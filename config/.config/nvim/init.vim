" Remove ALL auto-commands.  This avoids having the
" autocommands twice when the vimrc file is sourced again.
autocmd!

" Plugin Manager
source ~/.config/nvim/rc/vundle.vim

syntax on
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete

" to have mouse scrolling in urxvt
set mouse=a

"set t_Co=256
set laststatus=2
set modeline
set tabstop=4 sw=0 expandtab
set number cursorline " nu cul

" Airline status line
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
"let g:airline_theme='papercolor'
let g:airline_theme='raven'
let g:WebDevIconsOS='unix'

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:indentLine_char = '|'

" jdegr for Powerline status
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
" Use 256 colours (Use this setting only if your terminal supports 256 colours)

" keybindings
let mapleader="<"
nnoremap <C-Home> gg
nnoremap <C-End> G<End>
inoremap <C-Home> <Esc>ggi
inoremap <C-End> <Esc>G<End>i
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>

" for vim-plug addons manager
"call plugbegin('~/.vim/add-on')
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"call plugend()

" Pathogen
"execute pathogen#infect()

" VimFiler
:let g:vimfiler_as_default_explorer = 1

nmap <buffer> . <Plug>(vimfiler_toggle_visible_dot_files)

" Colorscheme
colorscheme space-vim-dark
hi Comment cterm=italic

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" Go back to last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" .vimrc manipulation

" vim: ts=2 sw=0 et
