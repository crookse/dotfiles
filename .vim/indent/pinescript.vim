" Vim indent file
" Language: TradingView Pine Script (v6)
"
" Pine blocks are defined by indentation, so new lines are indented one level after a line that
" opens a block (if/else/for/while/switch/type/enum, `x = if ...`, or a line ending in `=>`), and
" otherwise keep the previous line's indent. Lines that already have text are left alone, so
" `=` / `gg=G` never re-indents existing code.

if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=GetPineIndent()
setlocal indentkeys=o,O,!^F

let b:undo_indent = 'setlocal autoindent< indentexpr< indentkeys<'

if exists('*GetPineIndent')
  finish
endif

function! GetPineIndent() abort
  " Keep existing lines as they are.
  if getline(v:lnum) =~ '\S'
    return indent(v:lnum)
  endif

  let l:prev = prevnonblank(v:lnum - 1)
  if l:prev == 0
    return 0
  endif

  let l:ind = indent(l:prev)
  " Drop a trailing // comment (good enough: ignores // inside strings).
  let l:line = substitute(getline(l:prev), '\s*//.*$', '', '')

  let l:opens_block = l:line =~# '=>\s*$'
        \ || l:line =~# '^\s*\(if\|else\|for\|while\|switch\|type\|enum\)\>'
        \ || l:line =~# '^\s*\(\(var\|varip\)\s\+\)\=\(\h\w*\s\+\)\=\h\w*\s*:\==\s*\(if\|switch\|for\|while\)\>'

  return l:opens_block ? l:ind + shiftwidth() : l:ind
endfunction
