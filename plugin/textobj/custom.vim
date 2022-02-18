if exists('g:loaded_textobj_custom')
  finish
endif

call textobj#user#plugin('words', {
\      'alpha_i': {
\         'pattern' : '[a-zA-Z0-9]\+',
\         'select': 'il'
\      },
\      'argument_i': {
\         'pattern' : '\v[^,()]+',
\         'select': 'ig'
\      },
\      'python_function_i': {
\         'pattern' : '\v[a-zA-Z0-9_.]+',
\         'select': 'iy'
\      },
\    })


let g:loaded_textobj_custom = 1

" __END__
" vim: foldmethod=marker
