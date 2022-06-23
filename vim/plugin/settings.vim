vim9script

if !exists("g:ReloadConfigs")
  def g:ReloadConfigs()
    var is_empty_buffer = line('$') == 1 && getline(1) == ''
    var is_empty_bufname = bufname() == ''
    if !is_empty_buffer && !is_empty_bufname
      execute 'write'
    endif
    execute 'source ~/.vim/vimrc'
    execute 'source ~/.vim/plugin/mappings.vim'
    execute 'source ~/.vim/plugin/mouse.vim'
    execute 'source ~/.vim/plugin/edit.vim'
    execute 'source ~/.vim/plugin/file.vim'
    execute 'source ~/.vim/plugin/fzf.vim'
    execute 'source ~/.vim/plugin/settings.vim'
    execute 'source ~/.vim/plugin/custom.vim'
    execute 'source ~/.vim/plugin/tui.vim'
    execute 'source ~/.vim/plugin/search_replace.vim'
    execute 'source ~/.vim/plugin/test.vim'
    execute 'source ~/.vim/plugin/macros.vim'
    execute 'source ~/.vim/plugin/layout.vim'
    if has("gui_running")
      execute 'source ~/.vim/gvimrc'
    endif
    if !is_empty_buffer && !is_empty_bufname
      execute 'edit'
    endif
    echomsg 'User configuration is overloaded!'
  enddef
endif
command ReloadConfigs ReloadConfigs()
nnoremap <F5> :vim9cmd <SID>ReloadConfigs()<CR>

command EditorShowSettings :enew | put = execute('set all')
command EditorShowMaps :enew | put = execute('map')


# :help netrw
# g:netrw_banner = 0
# disable plugin netrw
# loaded_netrwPlugin = 1


g:php_special_functions = 0
g:go_highlight_functions = 1

# :help NERDTree
g:NERDTreeMouseMode = 2
g:NERDTreeWinSize = 40
g:NERDTreeMinimalUI = 0
g:NERDTreeShowHidden = 1
g:NERDTreeDirArrows = 1
g:NERDTreeShowLineNumbers = 0
g:NERDTreeNodeDelimiter = "\u00a0"
g:NERDTreeRemoveFileCmd = "gio trash "
g:NERDTreeRemoveDirCmd = "gio trash "
g:NERDTreeHijackNetrw = 0
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>




# :help UltiSnips
g:UltiSnipsSnippetDirectories = ["UltiSnips", "customsnippets"]
g:UltiSnipsExpandTrigger = "<tab>"
# list all snippets for current filetype
g:UltiSnipsListSnippets = "<c-d>"
g:UltiSnipsExpandTrigger = "<tab>"
g:UltiSnipsJumpForwardTrigger = "<c-b>"
g:UltiSnipsJumpBackwardTrigger = "<c-z>"


# :help asyncrun
g:asyncrun_open = 8
g:asyncrun_save = 2
nnoremap <F12> :vim9cmd AsyncStop<CR>
inoremap <F12> <ESC>:vim9cmd AsyncStop<CR>
cnoremap <F12> <ESC>:vim9cmd AsyncStop<CR>


# :help bufexplorer
g:fugitive_dynamic_colors = 0
g:bufExplorerShowNoName = 1
g:bufExplorerSortBy = "mru"
# g:bufExplorerSortBy = "number"
g:bufExplorerShowRelativePath = 1
g:bufExplorerDisableDefaultKeyMapping = 1
nnoremap <silent> <leader>b :BufExplorerHorizontalSplit<CR>
# nnoremap <silent> <leader>b :Buffers<CR>


# help codefmt
vnoremap <leader>= <Esc>:'<,'>FormatLines<CR>


g:goyo_width = 120
g:goyo_linenr = 1

# GoImportRun
g:goimports = 0

g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sh']
