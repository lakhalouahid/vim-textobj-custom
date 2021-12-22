let b:filetype =  nvim_buf_get_option(0,'filetype')
let b:pat = g:textobj_cell_seperators[b:filetype]


fun! textobj#cell#select_a() abort
  let surround = textobj#cell#get_surround_a(b:pat)
  if type(surround) == 7 | return 0 | endif
  return ['v', surround[0], surround[1]]
endfun


fun! textobj#cell#select_i() abort
  let surround = textobj#cell#get_surround_i(b:pat)
  if type(surround) == 7 | return 0 | endif
  return ['v', surround[0], surround[1]]
endfun


fun! textobj#cell#get_surround_i(pat) abort
  let surround = textobj#cell#get_surround_lines(a:pat)
  if type(surround) == 7 | return v:null | endif
  if surround[1] == (surround[0]+1) || surround[0] >=  (line('$')-1) || surround[1] <=  1 | return v:null | endif
  let head_pos = [0, surround[0]+1, 1, 0]
  let tail_pos = [0, surround[1]-1, strlen(getline(surround[1]-1)), 0]
  return [head_pos, tail_pos]
endfun

fun! textobj#cell#get_surround_a(pat) abort
  let surround = textobj#cell#get_surround_lines(a:pat)
  if type(surround) == 7 | return v:null | endif
  let head_pos = [0, surround[0], 1, 0]
  let tail_pos = [0, surround[1], strlen(getline(surround[1])), 0]
  return [head_pos, tail_pos]
endfun

fun! textobj#cell#get_surround_lines(pat) abort
  let origin = line('.')
  let linenb = origin
  let linescount = line('$')
  while strlen(matchstr(getline(linenb), a:pat)) == 0
    let linenb -= 1
    if linenb == 0 | return v:null | endif " return 0 in no match foun upword
  endw
  let head_line = [0, linenb, 1, 0]
  let linenb = origin
  while strlen(matchstr(getline(linenb), a:pat)) == 0
    if linenb == linescount | break  | endif " return 0 in no match foun upword
    let linenb += 1
  endw
  let tail_line = linenb
  return [head_line, tail_line]
endfun
