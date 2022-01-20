DIFF_MOVEMENT
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

This filetype plugin provides movement commands and text objects for diff hunks.
Supports traditional, context and unified diff formats.

### RELATED WORKS

- textobj-gitgutter ([vimscript #4458](http://www.vim.org/scripts/script.php?script_id=4458)) provides an inner-hunk text object for
  hunks provided by the vim-gitgutter plugin. It also requires textobj-user.
- diff\_navigator ([vimscript #2361](http://www.vim.org/scripts/script.php?script_id=2361), somewhat continued maintenance at
  https://gitlab.com/mcepl/vim-diff_navigator/) overrides the default (, ) / {,
  } commands with next file / hunk (and can edit diffs through external
  filterdiff).

USAGE
------------------------------------------------------------------------------

                            Move around diff hunks:
    ]]                      Go to [count] next start of a diff hunk.
    ][                      Go to [count] next end of a diff hunk.
    [[                      Go to [count] previous start of a diff hunk.
    []                      Go to [count] previous end of a diff hunk.

    ih                      "inner hunk" text object, select [count] hunk contents.
    ah                      "a hunk" text object, select [count] hunks, including
                            the header.

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-diff_movement
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim diff_movement*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the CountJump plugin ([vimscript #3130](http://www.vim.org/scripts/script.php?script_id=3130)).

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-diff_movement/issues or email (address below).

HISTORY
------------------------------------------------------------------------------

##### 1.01    05-Jun-2013
- Avoid use of s:function() by using autoload function name. This fixes a
  regression in Vim 7.3.1032, reported by lilydjwg.

##### 1.00    03-Aug-2010
- First published version.

------------------------------------------------------------------------------
Copyright: (C) 2013-2022 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
