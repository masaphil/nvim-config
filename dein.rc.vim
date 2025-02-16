" dein configurations.

let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let g:dein#notification_icon = '~/.config/nvim/signs/warn.png'
let g:dein#install_log_filename = '~/dein.log'

let s:path = expand('$CACHE/dein')
" if !dein#load_state(s:path)
"   finish
" endif

let s:dein_toml = '~/.config/nvim/dein.toml'
let s:dein_lazy_toml = '~/.config/nvim/dein_lazy.toml'
let s:dein_ft_toml = '~/.config/nvim/deinft.toml'

call dein#begin(s:path, [
      \ expand('<sfile>'), s:dein_toml, s:dein_lazy_toml, s:dein_ft_toml
      \ ])

call dein#load_toml(s:dein_toml, {'lazy': 0})
call dein#load_toml(s:dein_lazy_toml, {'lazy' : 1})
call dein#load_toml(s:dein_ft_toml)
"call dein#add('nvim-treesitter/nvim-treesitter', {'merged': 0})

let s:vimrc_local = findfile('vimrc_local.vim', '.;')
if s:vimrc_local !=# ''
  " Load develop version plugins.
  call dein#local(fnamemodify(s:vimrc_local, ':h'),
        \ {'frozen': 1, 'merged': 0},
        \ ['vim*', 'nvim-*', 'unite-*', 'neco-*', '*.vim', 'denite.nvim'])
  call dein#local(fnamemodify(s:vimrc_local, ':h'),
        \ {'frozen': 1, 'merged': 0},
        \ ['deoplete-*', '*.nvim'])
endif

call dein#end()
call dein#save_state()

if dein#check_install()
  " Installation check.
  call dein#install()
endif
