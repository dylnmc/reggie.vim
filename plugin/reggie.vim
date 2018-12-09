
" PASTE AFTER:
" ~~~~~~~~~~~
nnoremap <expr> <plug>(reggiePasteAfter)  v:register ==# '"' ? '"'.reggie#getPaste().'p' : 'p'
xnoremap <expr> <plug>(reggiePasteAfter)  v:register ==# '"' ? '"'.reggie#getPaste().'p' : 'p'

" PASTE BEFORE:
" ~~~~~~~~~~~~
nnoremap <expr> <plug>(reggiePasteBefore) v:register ==# '"' ? '"'.reggie#getPaste().'P' : 'P'
xnoremap <expr> <plug>(reggiePasteBefore) v:register ==# '"' ? '"'.reggie#getPaste().'P' : 'P'

" YANK:
" ~~~~
nnoremap <expr> <plug>(reggieYank) v:register ==# '"' ? '"'.reggie#getYank().'y' : 'y'
xnoremap <expr> <plug>(reggieYank) v:register ==# '"' ? '"'.reggie#getYank().'y' : 'y'

" PROMPT:
" ~~~~~~
nnoremap <plug>(reggiePrompt) :call reggie#prompt()<cr>

" COMMANDS:
" ~~~~~~~~
command! -bar -nargs=1 SetReg      call reggie#setPaste(<q-args>) <bar> call reggie#setYank(<q-args>)
command! -bar -nargs=1 SetPasteReg call reggie#setPaste(<q-args>)
command! -bar -nargs=1 SetYankReg  call reggie#setYank(<q-args>)
command! -bar -nargs=0 NoReg       call reggie#setPaste('"') <bar> call reggie#setYank('"')
command! -bar -nargs=0 NoPasteReg  call reggie#setPaste('"')
command! -bar -nargs=0 NoYankReg   call reggie#setYank('"')
command! -bar -nargs=0 RegPrompt   call reggie#prompt()

" DEFAULTS:
" ~~~~~~~~
" if not already mapped: <localleader>{action}
if ! hasmapto("\<plug>(reggiePasteAfter)", 'n')
	silent! nmap <unique> <localleader>p <plug>(reggiePasteAfter)
endif
if ! hasmapto("\<plug>(reggiePasteBefore)", 'v')
	silent! xmap <unique> <localleader>p <plug>(reggiePasteAfter)
endif
if ! hasmapto("\<plug>(reggiePasteBefore)", 'n')
	silent! nmap <unique> <localleader>P <plug>(reggiePasteBefore)
endif
if ! hasmapto("\<plug>(reggiePasteBefore)", 'v')
	silent! xmap <unique> <localleader>P <plug>(reggiePasteBefore)
endif
if ! hasmapto("\<plug>(reggiePasteBefore)", 'n')
	silent! nmap <unique> <localleader>y <plug>(reggieYank)
endif
if ! hasmapto("\<plug>(reggiePasteBefore)", 'v')
	silent! xmap <unique> <localleader>y <plug>(reggieYank)
endif
if ! hasmapto("\<plug>(reggiePromp)", 'n')
	silent! nmap <unique> <localleader>" <plug>(reggiePrompt)
endif

