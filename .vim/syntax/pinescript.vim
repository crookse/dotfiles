" Vim syntax file
" Language: TradingView Pine Script (v6)
" Filenames: *.pine, *.pinescript
"
" Colors (set below, not taken from the colorscheme):
"   red         operators, control keywords (if/for/and/or ...), assigned variables, named arguments
"   orange      names of user-defined functions (`name(args) =>`)
"   yellow      strings
"   pale yellow numbers
"   gray        comments
"   plain       everything else (types, built-ins, function calls); `color.` / `size.` in bold
"
" Note: when several matches start at the same position, the one defined LAST wins, so general
" patterns (operators) come first and specific ones (strings, comments) come last.

if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax case match

" Operators (including => and :=)
syntax match   pineOperator    "[-+*/%<>=!?:]"

" Generic types stay plain: array<OrderBlock>, map<string, line>
syntax match   pineGeneric     "\<\h\w*<\s*\h\w*\%(\s*,\s*\h\w*\)*\s*>"

" Square brackets
syntax match   pineBracket     "[][]"

" Assigned variables and named arguments: x = ..., x := ..., x += ..., f(overlay = true)
syntax match   pineAssign      "\<\h\w*\ze\s*[-+*/%:]\==[=>]\@!"

" Names of user-defined functions and methods: name(args) =>
syntax match   pineFuncDef     "^\s*\%(export\s\+\)\=\%(method\s\+\)\=\zs\h\w*\ze\s*(.*)\s*=>"

" Bold namespace for color.* and size.*, and input.color(...)
syntax match   pineNsBold      "\<\%(color\|size\)\ze\.\h"
syntax match   pineMemberType  "\.\zscolor\ze\s*("

" Control keywords
syntax keyword pineKeyword     if else switch for while to by in break continue and or not

" Numbers
syntax match   pineNumber      "\<\d\+\%(\.\d*\)\=\%([eE][+-]\=\d\+\)\=\>"
syntax match   pineNumber      "\.\d\+\%([eE][+-]\=\d\+\)\=\>"

" Strings
syntax match   pineEscape      contained "\\."
syntax region  pineString      start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=pineEscape
syntax region  pineString      start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline contains=pineEscape

" Comments (including //@version=6)
syntax keyword pineTodo        contained TODO FIXME XXX NOTE
syntax match   pineComment     "//.*$" contains=pineTodo,@Spell

let b:current_syntax = 'pinescript'

" Explicit colors, re-applied when the colorscheme reloads (it clears all highlight groups).
function! s:PineColors() abort
  highlight pineComment    ctermfg=241 guifg=#626262 cterm=NONE gui=NONE
  highlight pineString     ctermfg=221 guifg=#ffd75f cterm=NONE gui=NONE
  highlight pineEscape     ctermfg=221 guifg=#ffd75f cterm=NONE gui=NONE
  highlight pineNumber     ctermfg=229 guifg=#ffffaf cterm=NONE gui=NONE
  highlight pineOperator   ctermfg=203 guifg=#ff5f5f cterm=NONE gui=NONE
  highlight pineKeyword    ctermfg=203 guifg=#ff5f5f cterm=NONE gui=NONE
  highlight pineAssign     ctermfg=203 guifg=#ff5f5f cterm=NONE gui=NONE
  highlight pineFuncDef    ctermfg=209 guifg=#ff875f cterm=NONE gui=NONE
  highlight pineBracket    ctermfg=176 guifg=#d787d7 cterm=NONE gui=NONE
  highlight pineMemberType ctermfg=74  guifg=#5fafd7 cterm=NONE gui=NONE
  highlight pineNsBold     cterm=bold  gui=bold
  highlight default link pineTodo Todo
endfunction

call s:PineColors()

augroup pinescriptColors
  autocmd!
  autocmd ColorScheme * call s:PineColors()
augroup END

let &cpo = s:cpo_save
unlet s:cpo_save
