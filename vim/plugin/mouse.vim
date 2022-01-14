vim9script

set mouse=a
def MouseToggle()
  if &mouse == 'a'
    execute 'set mouse='
  else
    execute 'set mouse=a'
  endif
enddef
nnoremap <Leader>1 :vim9cmd <SID>MouseToggle()<CR>
