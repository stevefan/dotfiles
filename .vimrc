"TODO Latex Plugin
"TODO Python IDE
"TODO Salt
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

""""""""""""""""""""""""""""""""""
"BEFORE YOU DO ANYTHING WITH VIM:"
" open and work through vimtutor "
"   & read the help files with   "
"     <ESC> :help user-manual    "
""""""""""""""""""""""""""""""""""

set nocompatible

" VIM PLUG:
" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugins'
call plug#begin('~/.vim/plugged')
    "Sane Defaults
    Plug 'tpope/vim-sensible'
    "Formatting
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'junegunn/vim-easy-align' "TODO tutorial
    Plug 'tmhedberg/SimpylFold'
    "Syntax
    Plug 'scrooloose/syntastic' "TODO tutorial

    "Filesystem
    Plug 'scrooloose/nerdtree' "TODO tutorial

    "Git 
    Plug 'tpope/vim-fugitive' "TODO tutorial
    "Python
    Plug 'vim-scripts/indentpython.vim' "TODO tutorial
    Plug 'nvie/vim-flake8' "TODO tutorial

    "Color
    Plug 'jnurmine/Zenburn'
    Plug 'altercation/vim-colors-solarized'
    Plug 'tomasr/molokai'
" Initialize plugin system
call plug#end()
" Vim-Plug automatically execuits 'filetype plugin indent on'
" filetype plugin on


" ENABLE SYNTAX HIGHLIGHTING:
" https://stackoverflow.com/questions/33380451/is-there-a-difference-between-syntax-on-and-syntax-enable-in-vimscript
if !exists("g:syntax_on")
    syntax enable
endif


" RELOAD VIMRC ON WRITE:
" use :so % while editing .vimrc
" vim auto-reloads configuration
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END


" VIM EDITOR:
set number "Showing line numbers and length
set pastetoggle=<F2> " Better Copy and Paste
" Use "+yy to yank to plus register for pasting wuth xterm_clipboard
set clipboard=unnamed
set mouse=a " Mouse 
set bs=2 " backspace
set encoding=utf-8
set cursorline " show a visual line under the cursor's current line
set showmatch " show the matching part of the pair for [] {} and ()
set noswapfile
set tw=79  " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t  " dont' automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" COLOR SCHEME:
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  let g:zenburn_high_Contrast=0
  colorscheme zenburn
endif


" NAVAGATION COMMANDS:
" Window Navagation
" bind Ctrl+<movement> keys to move around the windows instead of Ctrl+w +<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l
" Tab Navagation
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" CODE BLOCK INDENTENTATION:
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" FOLDING:
" Plug SimplyFold
set foldmethod=indent
set foldlevel=99
nnoremap <space> za " Enable folding with the spacebar


" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" Search down into subfolders
" Provides tab-competion for all file-related tasks
set path+=**
" Display all mathcing files when we tab complete
set wildmenu
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - :b lets you autocomplete any open buffer
"TODO ADD nerdtree integration


" CUSTOM KEY MAPPINGS:
" map sort function to a key
" vnoremap <Leader>s :sort<CR>


" Default File Editing:
" TODO determine and add contents


" Begin PEP8 Compliance:
" ----------------------

au BufNewFile, BufRead *.py set tabstop=4
au BufNewFile, BufRead *.py set softtabstop=4
au BufNewFile, BufRead *.py set shiftwidth=4 " for using >> or << commands
au BufNewFile, BufRead *.py set shiftround
au BufNewFile, BufRead *.py set expandtab
au BufNewFile, BufRead *.py set autoindent
au BufNewFile, BufRead *.py set fileformat=unix

" enable all Python syntax highlighting features
let python_highlight_all = 1

" --------------------
" End PEP8 Compliance:


" Full Stack Development:
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2


" Other Tricks:


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
" NOW WE CAN
" - Use ^n and ^p to go back and forth in the suggestion list

" SNIPPETS:
" Read an empty HTML template and move cursor to title
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
