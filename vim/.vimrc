" Remove ALL auto-commands.  This avoids having the
" autocommands twice when the vimrc file is sourced again.
autocmd!

syntax on
filetype plugin indent on

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set omnifunc=syntaxcomplete#Complete

" to have mouse scrolling in urxvt
set mouse=a

set t_Co=256
set laststatus=2
set modeline
set tabstop=4 expandtab
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
  call vam#ActivateAddons(["github:liuchengxu/space-vim-dark"], {})
  call vam#ActivateAddons(["The_NERD_tree"], {})
  call vam#ActivateAddons(["github:tiagofumo/vim-nerdtree-syntax-highlight"], {})
  call vam#ActivateAddons(["github:Xuyuanp/nerdtree-git-plugin"], {})
  call vam#ActivateAddons(["github:ryanoasis/vim-devicons"], {})
  call vam#ActivateAddons(["vim-airline"], {})
  call vam#ActivateAddons(["vim-airline-themes"], {}) " need to be in vim-pi/db/scmsources.vim
  call vam#ActivateAddons(["unite"], {})
  call vam#ActivateAddons(["vimfiler"], {})
  call vam#ActivateAddons(["github:junegunn/fzf"], {})
  call vam#ActivateAddons(["github:junegunn/fzf.vim"], {})
  call vam#ActivateAddons(["fugitive"], {})
  call vam#ActivateAddons(["vim-gitgutter"], {})
  call vam#ActivateAddons(["Buffergator"], {})
  call vam#ActivateAddons(["github:myusuf3/numbers.vim"], {})
  call vam#ActivateAddons(["github:Yggdroot/indentLine"], {})
  call vam#ActivateAddons(["github:WolfgangMehner/bash-support"], {})

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

" Add ranger as a file chooser in vim
"
" If you add this code to the .vimrc, ranger can be started using the command
" ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>

" Colorscheme
colorscheme space-vim-dark
hi Comment cterm=italic

" Transparent background
hi Normal guibg=NONE ctermbg=NONE


" .vimrc manipulation

" vim: ts=2 et
