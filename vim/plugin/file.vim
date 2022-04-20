vim9script

set autoread
set autowrite

def CopyPath(path: string)
  @+ = path
  echo "copied to clipboard path: " .. path
enddef
command PathDirCopyAbsolute :vim9cmd CopyPath(expand('%:p:h'))
command PathDirCopyRelative :vim9cmd CopyPath(expand('%:h'))
command PathFileCopyAbsolute :vim9cmd CopyPath(expand('%:p'))
command PathFileCopyRelative :vim9cmd CopyPath(expand('%'))

command FileCopyNameAll :vim9cmd CopyPath(expand('%:t'))
command FileCopyName :vim9cmd CopyPath(expand('%:t:r'))
# command FileCopyName :vim9cmd exe "@+ = expand('%:t')"

command EditorShowLineEncoding :echo &fileformat
command EditorShowType :echo &filetype

def RenameFile()
  var prev_path = expand('%')
  var current_path = input('New file name: ', expand('%'), 'file')
  if current_path != '' && current_path != prev_path
    execute 'saveas ' .. current_path
    delete(prev_path)
    execute 'edit'
  endif
enddef
command FileRename RenameFile()


def RemoveFile()
  var path = expand('%:p')
  if !filereadable(path)
    echoerr "Not found file: " .. path
    return
  endif
  execute "bdelete " .. expand('%')
  execute "!gio trash " .. path
  echomsg "File removed!"
enddef
command FileRemove RemoveFile()


# Open current file with Encode
nnoremap <Leader>ee :edit ++enc= %<left><left>

# command FileEncodeReopenWithWinCyrilic :e ++enc=cp1251
command EncodeDetectThis :!chardet3 %
command EncodingSupportedShow :help encoding-values
command EncodingShow :echo exists(&fileencoding) ? &fileencoding : &encoding
command CdToFile :execute 'cd ' .. expand('%:p:h')
