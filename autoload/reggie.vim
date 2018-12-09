
if ! exists('s:pasteReggie')
	let s:pasteReggie = '"'
endif
if ! exists('s:yankReggie')
	let s:yankReggie   = '"'
endif

function! reggie#setPaste(reggie)
	if a:reggie !~# '^[a-z0-9"+*-:#%.]$'
		echohl ErrorMsg
		echon "\rInvalid register name: ".a:reggie
		echohl NONE
		return
	endif
	let s:pasteReggie = a:reggie
endfunction

function! reggie#setYank(reggie)
	if a:reggie !~# '^[a-z0-9"+*-:#%.]$'
		echohl ErrorMsg
		echon "\rInvalid register name: ".a:reggie
		echohl NONE
		return
	endif
	let s:yankReggie = a:reggie
endfunction

function! reggie#getPaste()
	return s:pasteReggie
endfunction

function! reggie#getYank()
	return s:yankReggie
endfunction

function! reggie#prompt()
	echon "\rSetReg: "
	let l:reggie = nr2char(getchar())
	call reggie#setYank(l:reggie)
	call reggie#setPaste(l:reggie)
endfunc

