" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible


" Set dpp base path (required)
const s:dpp_base = '~/.cache/dpp/'


" Set dpp source path (required)
" NOTE: The plugins must be cloned before.
const s:dpp_src = '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
const s:denops_src = '~/.cache/dpp/repos/github.com/denops/denops.vim'
"const s:denops_installer =
"\ '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer'
const s:dpp_config = '~/.vim/rc/dpp.ts'

const s:dpp_ext_toml = "~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml"
const s:dpp_ext_lazy = "~/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy"
const s:dpp_ext_installer = "~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer"
const s:dpp_protocol_git = "~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git"


" Set dpp runtime path (required)
execute 'set runtimepath^=' .. s:dpp_src

execute 'set runtimepath^=' .. s:dpp_ext_toml
execute 'set runtimepath^=' .. s:dpp_ext_lazy
execute 'set runtimepath^=' .. s:dpp_ext_installer
execute 'set runtimepath^=' .. s:dpp_protocol_git

if s:dpp_base->dpp#min#load_state()
  " NOTE: dpp#make_state() requires denops.vim
  " NOTE: denops.vim and dpp plugins are must be added
  execute 'set runtimepath^=' .. s:denops_src
  "execute 'set runtimepath^=' .. s:denops_installer
  autocmd User DenopsReady
  \ : echohl WarningMsg
  \ | echomsg 'dpp load_state() is failed'
  \ | echohl NONE
  \ | call dpp#make_state(s:dpp_base, s:dpp_config)
endif


autocmd User Dpp:makeStatePost
      \ : echohl WarningMsg
      \ | echomsg 'dpp make_state() is done'
      \ | echohl NONE

" Attempt to determine the type of a file based on its name and
" possibly its " contents. Use this to allow intelligent
" auto-indenting " for each filetype, and for plugins that are
" filetype specific.
filetype indent plugin on


" Enable syntax highlighting
if has('syntax')

  syntax on

endif


