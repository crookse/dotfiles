" nvim config: a 1:1 copy of vim.
"
" ~/.vim/vimrc is the only real config. This file undoes nvim's own defaults (options, mappings,
" built-in plugins, true-color theme) so that nvim looks and behaves like vim, then sources vimrc.
"
" ~/.config/nvim is a symlink to this directory (~/dotfiles/.vim/nvim).

"///////////////////////////////////////////////////////////////////////////////////////////////////
"// FILE MARKER - BEFORE VIMRC /////////////////////////////////////////////////////////////////////
"///////////////////////////////////////////////////////////////////////////////////////////////////

" Use the terminal's 256-color palette like vim does. crookse_glacier only defines cterm colors, and
" nvim enables termguicolors automatically when COLORTERM=truecolor.
set notermguicolors

" Restore vim's compiled defaults where nvim's differ (vimrc overrides any of these it sets itself).
set noautoindent
set noautoread
set nosmarttab
set noshowcmd
set belloff=
set display=
set formatoptions=tcq
set joinspaces
set startofline
set switchbuf=
set wildoptions=
set jumpoptions=
set nottimeout
set ttimeoutlen=-1
set history=200
set tabpagemax=10
set tags=./tags,tags
set nrformats=bin,octal,hex
set complete=.,w,b,u,t,i
set cpoptions=aABceFs
set fillchars=vert:\|,fold:-,eob:~,lastline:@
set shortmess=filnxtToOS
set sidescroll=0
set viewoptions+=options
set sessionoptions+=options
set nolangnoremap

" Remove nvim's built-in default mappings (vim has none of these). This runs before plugins load,
" so vim-unimpaired installs its own [ and ] mappings as it does in vim.
for s:lhs in ['&', 'gO', 'gri', 'grr', 'gra', 'grn', 'grt', 'gc', 'gcc', 'gx',
      \ '[d', ']d', '[D', ']D', '<C-W>d', '<C-W><C-D>', '[<Space>', ']<Space>',
      \ '[b', ']b', '[B', ']B', '[t', ']t', '[T', ']T', '[<C-T>', ']<C-T>',
      \ '[a', ']a', '[A', ']A', '[l', ']l', '[L', ']L', '[<C-L>', ']<C-L>',
      \ '[q', ']q', '[Q', ']Q', '[<C-Q>', ']<C-Q>']
  execute 'silent! nunmap ' . s:lhs
endfor
for s:lhs in ['#', '*', '@', 'Q', 'gra', 'gc', 'gx']
  execute 'silent! xunmap ' . s:lhs
endfor
silent! ounmap gc
for s:lhs in ['<C-S>', '<C-W>', '<C-U>', '<Tab>', '<S-Tab>']
  execute 'silent! iunmap ' . s:lhs
endfor
for s:lhs in ['<C-S>', '<Tab>', '<S-Tab>']
  execute 'silent! sunmap ' . s:lhs
endfor
unlet s:lhs

" Built-in plugins vim doesn't load by default.
let g:editorconfig = v:false
let g:loaded_matchit = 1

"///////////////////////////////////////////////////////////////////////////////////////////////////
"// FILE MARKER - VIMRC ////////////////////////////////////////////////////////////////////////////
"///////////////////////////////////////////////////////////////////////////////////////////////////

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

"///////////////////////////////////////////////////////////////////////////////////////////////////
"// FILE MARKER - AFTER VIMRC //////////////////////////////////////////////////////////////////////
"///////////////////////////////////////////////////////////////////////////////////////////////////

" vimrc's guicursor additions are GUI-only in vim, but nvim applies them to the terminal cursor.
set guicursor=

" vimrc only sets this when has('popupwin'), which is false in nvim.
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" Use vim's regex syntax highlighting instead of treesitter.
augroup nvimCompatTreesitter
  autocmd!
  autocmd FileType * lua pcall(vim.treesitter.stop)
augroup END

" Apply vim's exact highlight groups (generated from a real vim session by
" ~/.vim/nvim/export_highlights.vim), then map nvim-only UI groups to their vim equivalents.
function! s:ApplyVimHighlights() abort
  let l:file = expand('~/.vim/nvim/vim_highlights.vim')
  if filereadable(l:file)
    execute 'source ' . fnameescape(l:file)
  endif
  hi! link WinSeparator VertSplit
  hi! link NormalFloat  Pmenu
  hi! link FloatBorder  Pmenu
  hi! link MsgArea      Normal
endfunction

augroup nvimCompatHighlights
  autocmd!
  autocmd ColorScheme crookse_glacier call s:ApplyVimHighlights()
  autocmd VimEnter * call s:ApplyVimHighlights()
augroup END
