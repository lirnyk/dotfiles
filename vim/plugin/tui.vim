vim9script

import "../lib/statusline.vim" as statusline

# Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

# needed for work undo/redo, otherwise history (undo/redo) will not be saved
set hidden

set mouse=a

set number
# set number relativenumber
# set cursorcolumn
# set signcolumn=number
# set numberwidth=6
set cursorline
set cursorlineopt=number

set listchars=tab:\ \ ,precedes:<,extends:>
set list

if (has("termguicolors"))
  set termguicolors
endif

augroup MyColors
  autocmd ColorScheme default {
    highlight CursorLine    cterm=NONE ctermfg=NONE guifg=NONE
    highlight CursorColumn  cterm=NONE ctermfg=NONE guifg=NONE
    highlight CurSearch gui=reverse cterm=reverse
    highlight ExtraWhitespace guibg=#7E8E91
  }
  autocmd ColorScheme jellybeans_optimized {
    hi DbgBreakptLine guifg=#ffffff guibg=#93B97E
    hi DbgBreakptSign guifg=#ffffff guibg=#93B97E
    hi DbgCurrentLine guifg=#ffffff guibg=#D06567
    hi DbgCurrentSign guifg=#ffffff guibg=#D06567
    hi DbgDisabledSign guifg=#ffffff guibg=#648699
    hi DbgDisabledLine guifg=#ffffff guibg=#648699
    hi DbgCurrentStackPositionSign guifg=#ffffff guibg=#648699
    hi DbgCurrentStackPositionLine guifg=#ffffff guibg=#648699

    hi LspErrorHighlight guifg=#ffffff guibg=#902020
    hi LspWarningHighlight guifg=#000000 guibg=#c7c7c7
  }
augroup end

colorscheme jellybeans_optimized

# set linebreak
set showbreak=->
set nowrap

set history=1000
set wildmenu wildmode=full
set wildignorecase
set wildoptions=pum pumheight=20
set shortmess-=S
set showcmd
# set complete=.,b,u,t
# set complete=.,t
set complete=.

set splitbelow
set title

set confirm

set nomore

set display+=lastline

if !has('gui_running')
  # cursor shape in difference mode
  &t_SI = "\<esc>[6 q"
  &t_SR = "\<esc>[3 q"
  &t_EI = "\<esc>[2 q"

  if &term =~ '^\%(alacritty\)'
    &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  if &term == 'xterm-kitty'
    &t_ut = ''
  endif
endif



set laststatus=2

var StatusRef = statusline.StatuslineExpr
&statusline = '%!' .. expand('<SID>') .. 'StatusRef()'
