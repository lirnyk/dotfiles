vim9script

import "../lib/statusline.vim" as statusline

# Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

# needed for work undo/redo, otherwise history (undo/redo) will not be saved
set hidden
# keep cursor column position
set nostartofline

set mouse=a

set number
# set number relativenumber
# set cursorcolumn
# set signcolumn=number
# set numberwidth=6
set cursorline
set cursorlineopt=number
augroup InsertHl
  autocmd InsertEnter * set cursorlineopt=number,line
  autocmd InsertLeave * set cursorlineopt=number
augroup END

# horizontal scroll
set sidescroll=1
set sidescrolloff=3

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
  autocmd ColorScheme gruvbox {
    highlight CurSearch guifg=#1D2021 guibg=#fe8019
    hi link gitcommitSummary GruvboxYellow

    hi Ignore guifg=#8F8F8F
    hi link DirvishGitIgnored Ignore

    highlight ExtraWhitespace guibg=#7c6f64
    hi NormalNC guibg=#648699
    highlight InsertColor guifg=#282828 guibg=#83a598
  }
  autocmd ColorScheme zenburn {
    highlight CurSearch guifg=#0f0f0f guibg=#f8f893
    hi link markdownCode String
    hi link markdownCodeBlock String
    hi link markdownCodeDelimiter String

    hi link diffAdded Comment
    hi link diffRemoved String
    hi link diffChanged Number

    hi Ignore guifg=#8F8F8F
    hi link DirvishGitIgnored Ignore

    highlight ExtraWhitespace guibg=#797979
    hi NormalNC guibg=#3f3f3f
    highlight InsertColor guifg=#313633 guibg=#7f9f7f gui=bold cterm=bold
  }
  autocmd ColorScheme nord {
    highlight link CurSearch IncSearch

    highlight ExtraWhitespace guibg=#616E88
    highlight Comment guifg=#a6acb9
    hi NormalNC guibg=#242832
    highlight InsertColor guifg=#3B4252 guibg=#a3be8c
  }
augroup end


# g:gruvbox_invert_selection = 0
# g:gruvbox_italic = 0
# g:gruvbox_underline = 1
# g:gruvbox_contrast_light = "hard"
# g:gruvbox_contrast_dark = "medium"
# g:gruvbox_guisp_fallback = "bg" # fix spell colors
# g:gruvbox_vert_split = "bg1"
# set background=dark
# colorscheme gruvbox

# g:zenburn_alternate_Visual = 1
# g:zenburn_high_Contrast = 1
# g:zenburn_disable_Label_underline = 1
# colorscheme zenburn

colorscheme nord


# different color depending on focus
augroup WinBg
    autocmd WinEnter,BufEnter * setlocal wincolor=
    autocmd WinLeave,BufLeave * setlocal wincolor=NormalNC
augroup end

# colorscheme default
# set background=dark


# set linebreak
set showbreak=->
set nowrap
# set wrap
set linebreak   # wrap lines at convenient points
set breakindent # wrap lines such that vertical indent is not broken

set history=1000
set wildmenu wildmode=full
set wildignorecase
set wildoptions=pum pumheight=20
set shortmess-=S
set showcmd
# set complete=.,b,u,t
# set complete=.,t
set complete=.,w

set splitbelow
set title

set confirm


set display+=lastline

if !has('gui_running')
  # cursor shape in difference mode
  # &t_SI = "\<esc>[6 q"
  &t_SI = "\<esc>[2 q"
  &t_SR = "\<esc>[4 q"
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
