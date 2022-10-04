vim9script

# :help netrw
g:loaded_netrw = 0
g:loaded_netrwPlugin = 0

g:php_special_functions = 0
g:go_highlight_functions = 1

# fzf
g:fzf_history_dir = '~/.fzf-history'

# :help NERDTree
g:NERDTreeMouseMode = 2
g:NERDTreeWinSize = 40
g:NERDTreeMinimalUI = 0
g:NERDTreeShowHidden = 1
g:NERDTreeIgnore = []
g:NERDTreeDirArrows = 1
g:NERDTreeShowLineNumbers = 0
g:NERDTreeNodeDelimiter = "\u00a0"
g:NERDTreeRemoveFileCmd = "gio trash "
g:NERDTreeRemoveDirCmd = "gio trash "
g:NERDTreeHijackNetrw = 0

# vim9 fix issue https://github.com/preservim/nerdtree/issues/1321
g:NERDTreeMinimalMenu = 1


# :help UltiSnips
g:UltiSnipsSnippetDirectories = ["UltiSnips", "customsnippets"]


# :help asyncrun
g:asyncrun_open = 8
g:asyncrun_save = 2


g:fugitive_dynamic_colors = 0

# g:buffergator_viewport_split_policy = "n"
# g:buffergator_sort_regime = "bufnum"
# g:buffergator_suppress_keymaps = 1
# g:buffergator_autodismiss_on_select = 1

# :help bufexplorer
# g:bufExplorerShowNoName = 1
# g:bufExplorerSortBy = "mru"
# g:bufExplorerShowRelativePath = 1
# g:bufExplorerDisableDefaultKeyMapping = 1
# g:bufExplorerShowTabBuffer = 0
# g:bufExplorerFindActive = 0

g:goyo_width = 120
g:goyo_linenr = 1

# GoImportRun
g:goimports = 0

g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sh', 'sql']


# LSP settings --------------------------------------------------
# g:lsp_document_code_action_signs_enabled = 0
# g:lsp_diagnostics_highlights_enabled = 1
# g:lsp_diagnostics_highlights_insert_mode_enabled = 0
g:lsp_auto_enable = 0
g:lsp_diagnostics_signs_enabled = 0
g:lsp_document_code_action_signs_enabled = 0
g:lsp_diagnostics_virtual_text_enabled = 1
g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
g:lsp_diagnostics_virtual_text_delay = 2000
g:lsp_inlay_hints_enabled = 1


# see lib/custom.vim
# g:vdebug_options = {
#  'port': 9000,
#  'path_maps': {"remote_folder": "local_folder"}
# }


# DEBUGGER
# g:vimspector_install_gadgets = ['vscode-go', 'vscode-php-debug']
