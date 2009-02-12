" diff_movement.vim: Movement over diff hunks with ]] etc. 
"
" DEPENDENCIES:
"   - custommotion.vim autoload script. 
"
" Copyright: (C) 2009 by Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'. 
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS 
"	001	12-Feb-2009	file creation from vim_movement.vim

let s:save_cpo = &cpo
set cpo&vim

"			Move around diff hunks: 
"]]			Go to [count] next start of a diff hunk. 
"][			Go to [count] next end of a diff hunk. 
"[[			Go to [count] previous start of a diff hunk. 
"[]			Go to [count] previous end of a diff hunk. 


" There are three branches for the three different diff types:
"   traditional | context | unified
let s:diffHunkHeaderPattern = '^\%(\d\+\%(,\d\+\)\=[cda]\d\+\>\|\*\{4,}$\|@@.*@@\)'

call custommotion#MakeBracketMotionWithCountSearch('<buffer>', '', '', 
\   s:diffHunkHeaderPattern,
\   '^\%(--- \|+++ \)\@!.*\n' . s:diffHunkHeaderPattern. '\|^\%(\*\{4,}\|=\{10,}\|diff \)\@!.*\n^\*\*\* \|^\%(\*\*\* \|=\{10,}\|diff \)\@!.*\n^--- .*\%( ----\)\@<!$\|^.*\nIndex: \|^.*\ndiff \|^.*\%$',
\   0
\)
" For the pattern-to-end, search for the line above the hunk header pattern, but
" exclude lines of the diff header (ending with --- in context diffs and +++ in
" unified diffs; traditional diffs have no header).
" Also match the start of a new diff file 
" - starting with *** in context diffs, but only if the preceding line doesn't
"   start with: 
"   - many ****'s, or it's the separator of a context diff
"   - many ==='s, or it's the separator after an Index:
"   - 'diff ', or it's the echoed diff command as a separator. 
" - starting with --- in unified diffs, but not matching --- .* ----, the
"   separator in a context diff, but only if the preceding line doesn't start
"   with: 
"   - ***, or it's a context diff
"   - many ==='s, or it's the separator after an Index:
"   - 'diff ', or it's the echoed diff command as a separator. 
" - or a line starting with 'Index: ' or 'diff '
" Finally match the last line of the buffer, because there's no special "end of
" diff" line, diffs just end after the last hunk.  

unlet s:diffHunkHeaderPattern

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
