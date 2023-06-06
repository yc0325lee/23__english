" vim: ft=vim ts=4 sw=4 tw=999 expandtab
" ----------------------------------------------------------------------------
" File : text.vim
" Description : 
" Author : yc0325lee
" Created : 2019-01-31 23:18:57 by yc0325lee
" Modified : 2019-02-01 22:30:43 by yc0325lee
" ----------------------------------------------------------------------------
syntax keyword eslGroup bet station messaging
"syn region textComment start="^\s*\#" skip="\\$" end="$"
"syn region textComment start=/;\s*\#/hs=s+1 skip="\\$" end="$"

highlight link eslGroup Error
"highlight def link tclComment Comment
