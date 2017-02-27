" Remove ALL auto-commands.  This avoids having the
" autocommands twice when the vimrc file is sourced again.
autocmd!

syntax on
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete

" to have mouse scrolling in urxvt
set mouse=a

set t_Co=256
set laststatus=2
set modeline
set tabstop=8 " expandtab
set number cul
" Airline status line
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'

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

" for vim-addon-manager
fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vamForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  let c.log_to_buf = 0
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
      \ shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
call vam#ActivateAddons(["vim-airline"], {})
call vam#ActivateAddons(["vim-airline-themes"], {}) " need to be in vim-pi/db/scmsources.vim
call vam#ActivateAddons(["unite"], {})
call vam#ActivateAddons(["vimfiler"], {})
call vam#ActivateAddons(["github:junegunn/fzf"], {})
call vam#ActivateAddons(["github:junegunn/fzf.vim"], {})
call vam#ActivateAddons(["fugitive"], {})
call vam#ActivateAddons(["github:liuchengxu/space-vim-dark"], {})
call vam#ActivateAddons(["Buffergator"], {})
"call vam#install#Install(["github:vim-airline/vim-airline-themes"], {})
"call vam#install#Install(["vim-airline-themes"], {})
endfun

call SetupVAM()
" end vim-addon-manager

" Pathogen
"execute pathogen#infect()

" VimFiler
:let g:vimfiler_as_default_explorer = 1

nmap <buffer> . <Plug>(vimfiler_toggle_visible_dot_files)

" Ranger file manager
function! Ranger()
exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
  if filereadable('/tmp/vim_ranger_current_file')
    exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
    call system('rm /tmp/vim_ranger_current_file')
  endif
  redraw!
endfun
map <Leader>x :call Ranger()<CR>

" Colorscheme
colorscheme space-vim-dark
hi Comment cterm=italic

" Transparent background
hi Normal guibg=NONE ctermbg=NONE


" .vimrc manipulation

" vim: ts=2 et
