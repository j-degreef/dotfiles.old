" for vim-addon-manager
fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.config/nvim/nvim-addons'

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
"  call vam#ActivateAddons(["vim-airline-themes"], {}) " need to be in vim-pi/db/scmsources.vim
  call vam#ActivateAddons(["unite"], {})
  call vam#ActivateAddons(["vimfiler"], {})
  call vam#ActivateAddons(["github:junegunn/fzf"], {})
  call vam#ActivateAddons(["github:junegunn/fzf.vim"], {})
  call vam#ActivateAddons(["fugitive"], {})
  call vam#ActivateAddons(["vim-gitgutter"], {})
  call vam#ActivateAddons(["Buffergator"], {})
  call vam#ActivateAddons(["github:myusuf3/numbers.vim"], {})
  call vam#ActivateAddons(["github:Yggdroot/indentLine"], {})
  call vam#ActivateAddons(["YouCompleteMe"], {})
  call vam#ActivateAddons(["github:vim-airline/vim-airline-themes"], {})
  "call vam#install#Install(["github:vim-airline/vim-airline-themes"], {})
  "call vam#install#Install(["vim-airline-themes"], {})
endfun
call SetupVAM()
" end vim-addon-manager


