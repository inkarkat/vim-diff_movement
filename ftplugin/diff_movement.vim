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
"[]			Go to [count] previous start of a diff hunk. 
"[[			Go to [count] previous end of a diff hunk. 


" There are three branches for the three different diff types:
"   traditional | context | unified
let s:diffHunkHeaderPattern = '^\%(\d\+\%(,\d\+\)\=[cda]\d\+\>\|\*\{4,}$\|@@.*@@\)'

call custommotion#MakeBracketMotionWithCountSearch('<buffer>', '', '', 
\   s:diffHunkHeaderPattern,
\   '^\%(---\|+++\)\@!.*\n' . s:diffHunkHeaderPattern. '\|^.*\%$'
\)
" For the pattern-to-end, search for the line above the hunk header pattern, but
" exclude lines of the diff header (ending with --- in context diffs and +++ in
" unified diffs; traditional diffs have no header). Also match the last line of
" the buffer, because there's no special "end of diff" line, diffs just end
" after the last hunk. 

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
