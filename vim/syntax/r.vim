" Vim syntax file
" Language:       R (GNU S)
" Maintainer:         Jakson Aquino <jalvesaq@gmail.com>
" Former Maintainers: Vaidotas Zemlys <zemlys@gmail.com>
"             Tom Payne <tom@tompayne.org>
" Last Change:        Wed Dec 31, 2014  12:36AM
" Filenames:          *.R *.r *.Rhistory *.Rt
"
" NOTE: The highlighting of R functions is defined in
" runtime files created by a filetype plugin, if installed.
"
" CONFIGURATION:
"   syntax folding can be turned on by
"
"
" Some lines of code were borrowed from Zhuojun Chen.

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword=@,48-57,_,.

syn case match

" Comment
syn match   rComment    "#.*$" contains=rTodo,@Spell
syn keyword rTodo       FIXME NOTE NOTES TODO XXX contained

" Roxygen
syn match rOKeyword contained "@\(param\|return\|name\|rdname\|examples\|include\|docType\)"
syn match rOKeyword contained "@\(S3method\|TODO\|aliases\|alias\|assignee\|author\|callGraphDepth\|callGraph\)"
syn match rOKeyword contained "@\(callGraphPrimitives\|concept\|exportClass\|exportMethod\|exportPattern\|export\|formals\)"
syn match rOKeyword contained "@\(format\|importClassesFrom\|importFrom\|importMethodsFrom\|import\|keywords\|useDynLib\)"
syn match rOKeyword contained "@\(method\|noRd\|note\|references\|seealso\|setClass\|slot\|source\|title\|usage\)"
syn match rOKeyword contained "@\(family\|template\|templateVar\|description\|details\|inheritParams\)"
syn match rOComment contains=@Spell,rOKeyword "#'.*"


if &filetype == "rhelp"
  " string enclosed in double quotes
  syn region rString contains=rSpecial,@Spell start=/"/ skip=/\\\\\|\\"/ end=/"/
  " string enclosed in single quotes
  syn region rString contains=rSpecial,@Spell start=/'/ skip=/\\\\\|\\'/ end=/'/
else
  " string enclosed in double quotes
  syn region rString contains=rSpecial,rStrError,@Spell start=/"/ skip=/\\\\\|\\"/ end=/"/
  " string enclosed in single quotes
  syn region rString contains=rSpecial,rStrError,@Spell start=/'/ skip=/\\\\\|\\'/ end=/'/
endif

syn match rStrError display contained "\\."


" New line, carriage return, tab, backspace, bell, feed, vertical tab, backslash
syn match rSpecial display contained "\\\(n\|r\|t\|b\|a\|f\|v\|'\|\"\)\|\\\\"

" Hexadecimal and Octal digits
syn match rSpecial display contained "\\\(x\x\{1,2}\|[0-8]\{1,3}\)"

" Unicode characters
syn match rSpecial display contained "\\u\x\{1,4}"
syn match rSpecial display contained "\\U\x\{1,8}"
syn match rSpecial display contained "\\u{\x\{1,4}}"
syn match rSpecial display contained "\\U{\x\{1,8}}"

" Statement
syn keyword rStatement   break next return
syn keyword rConditional if else
syn keyword rRepeat      for in repeat while

" Constant (not really)
syn keyword rConstant T F LETTERS letters month.abb month.name pi
syn keyword rConstant R.version.string

syn keyword rNumber   NA_integer_ NA_real_ NA_complex_ NA_character_

" Constants
syn keyword rConstant NULL
syn keyword rBoolean  FALSE TRUE
syn keyword rNumber   NA Inf NaN

" integer
syn match rInteger "\<\d\+L"
syn match rInteger "\<0x\([0-9]\|[a-f]\|[A-F]\)\+L"
syn match rInteger "\<\d\+[Ee]+\=\d\+L"

" number with no fractional part or exponent
syn match rNumber "\<\d\+\>"
" hexadecimal number
syn match rNumber "\<0x\([0-9]\|[a-f]\|[A-F]\)\+"

" floating point number with integer and fractional parts and optional exponent
syn match rFloat "\<\d\+\.\d*\([Ee][-+]\=\d\+\)\="
" floating point number with no integer part and optional exponent
syn match rFloat "\<\.\d\+\([Ee][-+]\=\d\+\)\="
" floating point number with no fractional part and optional exponent
syn match rFloat "\<\d\+[Ee][-+]\=\d\+"

" complex number
syn match rComplex "\<\d\+i"
syn match rComplex "\<\d\++\d\+i"
syn match rComplex "\<0x\([0-9]\|[a-f]\|[A-F]\)\+i"
syn match rComplex "\<\d\+\.\d*\([Ee][-+]\=\d\+\)\=i"
syn match rComplex "\<\.\d\+\([Ee][-+]\=\d\+\)\=i"
syn match rComplex "\<\d\+[Ee][-+]\=\d\+i"

syn match rAssign    '='
syn match rOperator    "&"
syn match rOperator    '-'
syn match rOperator    '\*'
syn match rOperator    '+'
if &filetype != "rmd" && &filetype != "rrst"
  syn match rOperator    "[|!<>^~/:]"
else
  syn match rOperator    "[|!<>^~`/:]"
endif
syn match rOperator    "%\{2}\|%\S\{-}%"
syn match rOperator '\([!><]\)\@<=='
syn match rOperator '=='
syn match rOpError  '\*\{3}'
syn match rOpError  '//'
syn match rOpError  '&&&'
syn match rOpError  '|||'
syn match rOpError  '<<'
syn match rOpError  '>>'

syn match rAssign "<\{1,2}-"
syn match rAssign "->\{1,2}"

" Source list of R functions produced by a filetype plugin (if installed)
if has("nvim")
  " Nvim-R
  runtime R/functions.vim
else
  " Vim-R-plugin
  runtime r-plugin/functions.vim
endif

" Functions that may add new objects
syn keyword rPreProc     library require attach detach source

if &filetype == "rhelp"
  syn match rHelpIdent '\\method'
  syn match rHelpIdent '\\S4method'
endif

" Name of object with spaces
if &filetype != "rmd" && &filetype != "rrst"
  syn region rNameWSpace start="`" end="`"
endif

if &filetype == "rhelp"
  syn match rhPreProc "^#ifdef.*"
  syn match rhPreProc "^#endif.*"
  syn match rhSection "\\dontrun\>"
endif

if exists("r_syn_minlines")
  exe "syn sync minlines=" . r_syn_minlines
else
  syn sync minlines=40
endif

syn match rDollar display contained "\$"
syn match rDollar display contained "@"
syn match rLstPrefix "[a-zA-Z0-9\\._]*\$" contains=rDollar
syn match rLstPrefix "[a-zA-Z0-9\\._]*@" contains=rDollar

syn match rFunctionWrappper "\(\.[a-zA-Z]\|\(\<\|\$@\)[a-zA-Z]\+\)[\.a-zA-Z_]*(" contains=rFunction contains=rArgument
syn match rFunction "\(\.[a-zA-Z]\|\<[a-zA-Z]\+\)[\.a-zA-Z_]*" contained

" Type
syn keyword rType array category character complex double function integer list logical matrix numeric vector data.frame

if version >= 508 
  if version <= 508
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default highlight links.  Can be overridden later.
  HiLink rTodo          Todo
  HiLink rAssign        Statement
  HiLink rBoolean       Boolean
  HiLink rComment       Comment
  HiLink rOComment      Comment
  HiLink rComplex       Number
  HiLink rConditional   Conditional
  HiLink rConstant      Constant
  HiLink rDollar        Type
  HiLink rFloat         Float
  HiLink rFunction      Function
  HiLink rHelpIdent     Identifier
  HiLink rhPreProc      PreProc
  HiLink rhSection      PreCondit
  HiLink rInteger       Number
  HiLink rLstPrefix     Normal
  HiLink rNameWSpace    Normal
  HiLink rNumber        Number
  HiLink rOperator      Operator
  HiLink rOpError       Error
  HiLink rPreProc       PreProc
  HiLink rRepeat        Repeat
  HiLink rSpecial       SpecialChar
  HiLink rStatement     Statement
  HiLink rString        String
  HiLink rStrError      Error
  HiLink rType          Type
  HiLink rOKeyword      Title
  delcommand HiLink
endif

" Define the default highlighting.

let b:current_syntax="r"

" vim: ts=8 sw=2
