if exists('g:loaded_textobj_cell')
  finish
endif

let g:textobj_cell_seperators = {'python': '\v^(##|#[ ]?%%)', 'vim': '^"""'}

call textobj#user#plugin('cells', {
\      'cell': {
\        'select-a': 'ac', 'select-a-function': 'textobj#cell#select_a',
\        'select-i': 'ic', 'select-i-function': 'textobj#cell#select_i',
\      },
\    })

call textobj#user#plugin('words', {
\      'alpha_i': {
\         'pattern' : '[a-zA-Z0-9]\+',
\         'select': 'il;'
\      },
\    })



let g:loaded_textobj_cell = 1

" __END__
" vim: foldmethod=marker
