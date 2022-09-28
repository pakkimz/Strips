function! StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff' && &filetype != 'text'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//ge
    keeppatterns %s/\(\s*\n\)\+\%$//ge
		keeppatterns %s/\%^\n\+//ge
		keeppatterns %s/\(\n\n\)\n\+/\1/ge
    call winrestview(l:save)
  endif
endfun

autocmd BufWrite * :call StripTrailingWhitespaces()
