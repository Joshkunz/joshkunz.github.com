divert(-1)
Macro that expands to the executable for rendering markdown.
define(`__MARKDOWN__',`pandoc')

Macro for rendering a file in markdown.
define(`MARKDOWN',`esyscmd(__MARKDOWN__` $1')')
divert(0)dnl
