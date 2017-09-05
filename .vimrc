"TODO Latex Plugin
"TODO Python IDE
"TODO Salt
"TODO Vundle vs Pathogen vs Vim-Plug?
"TODO Git? vim-fugitive ++
"TODO syntax tracker? syntastic ++
"TODO tags? tagbar
"TODO blockit
"TODO python.vim?
"TODO tab completion? Supertab?
"TODO ctrlp, file finder? command_T? nerd tree?
"TODO vim templates for LATEX
"TODO Surround.vim
"TODO Commentary? comment out?
"TODO repeat.vim?
"TODO relatedde
" Reference: https://www.youtube.com/watch?v=YhqsjUUHj6g&t=6s
set nocompatible


" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugins'
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
" Initialize plugin system
call plug#end()
" Vim-Plug automatically execuits 'filetype plugin indent on'
" filetype plugin on


" enable syntax highlighting
" https://stackoverflow.com/questions/33380451/is-there-a-difference-between-syntax-on-and-syntax-enable-in-vimscript
if !exists("g:syntax_on")
    syntax enable
endif


" use :so % while editing .vimrc
" vim auto-reloads configuration
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" show line numbers
set number

" TAB settings
set tabstop=4
set softtabstop=4
set shiftwidth=4 " when using >> or << commands, shift lines by 4 spaces
set shiftround
set expandtab "expand tabs into spaces
set autoindent " indent when moving to the next line while writing code


" show a visual line under the cursor's current line
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch

" Better Copy and Paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a
set bs=2

" Navagation Commands
" Window Navagation
" bind Ctrl+<movement> keys to move around the windows instead of Ctrl+w +<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l
" Tab Navagation
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
" vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" enable all Python syntax highlighting features
let python_highlight_all = 1


" Search down into subfolders
" Provides tab-competion for all file-related tasks
set path+=**

" Display all mathcing files when we tab complete
set wildmenu
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - :b lets you autocomplete any open buffer



" Showing line numbers and length
set number " show line numbers
set tw=79  " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t  " dont' automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233



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
