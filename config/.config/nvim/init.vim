" Remove ALL auto-commands.  This avoids having the
" autocommands twice when the vimrc file is sourced again.
autocmd!

" Vundle Plugin Manager {{{
source ~/.config/nvim/rc/vundle.vim
"}}}
" Settings {{{
syntax on
set nocompatible
filetype plugin indent on


" to have mouse scrolling in urxvt
set mouse=a
set laststatus=2
set modeline
set tabstop=4 sw=0 expandtab
set number cursorline " nu cul
set omnifunc=syntaxcomplete#Complete
" IndentLine
let g:indentLine_char = '|'
" Colorscheme
colorscheme space-vim-dark
"colorscheme evening
" Italic comments
hi Comment cterm=italic
" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" Remove toolbar
:set guioptions-=T

" LanguegeTool
let g:languagetool_jar='$HOME/src/LanguageTool-3.7/languagetool-commandline.jar'

" Disable syntatstic at startup
let g:syntastic_mode_map = { 'mode': 'passive' }

" Go back to last position in file {{{
    if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
    endif
    "}}}
"}}}
" Powerline status line (unused) doesn't work with nvim {{{
" Always show statusline
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
"Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"}}}
" Pathogen (unused) {{{
"execute pathogen#infect()
"}}}
" Vim-plug addons manager (unused) {{{
"call plugbegin('~/.vim/add-on')
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"call plugend()
"}}}
" VimFiler (unused) {{{
:let g:vimfiler_as_default_explorer = 1
"}}}
" NERDTree {{{
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
"}}}
" Keybindings {{{
let mapleader="<"
nnoremap <C-Home> gg
nnoremap <C-End> G<End>
inoremap <C-Home> <Esc>ggi
inoremap <C-End> <Esc>G<End>i
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
" Clear search hilight
nnoremap <Leader><space> :noh<cr>
"}}}
" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_shell_checkers = ['shellcheck']
let g:syntastic_shell_shellcheck_args = "-s bash -e 'Warning'"
"}}}
" Bash-support {{{
let s:BashDB_Debugger = "terminal"
" }}}
" Eclim {{{
let g:EclimCompletionMethod = 'omnifunc'
"}}}
" .vimrc manipulation {{{
" Reserved
"}}}
" Airline status line {{{
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
"let g:airline_theme='raven'
let g:WebDevIconsOS='unix'
"set guifont="Droid Sans Mono for Powerline" 12
set guifont="DejaVu Sans Mono for Powerline" 9
set encoding=utf-8
let g:airline_symbols.space = "\ua0"
"}}}

" vim: ts=2 sw=0 et fdm=marker
