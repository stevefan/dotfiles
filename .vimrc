set nocompatible

syntax enable
filetype plugin on

" Search down into subfolders
" Provides tab-competion for all file-related tasks
set path+=**

" Display all mathcing files when we tab complete
set wildmenu
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - :b lets you autocomplete any open buffer


" use :so % while editing .vimrc
" vim auto-reloads configuration

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END


" TAG JUMPING:
" Create 'tags' file, requires pkg 'ctags'
" command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up tag stack


" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list



" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


" SNIPPETS:
" Read an empty HTML template and move cursor to title
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a



