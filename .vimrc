"OBTAIN:
"TODO Latex Plugin
"TODO Python IDE
"TODO Salt
"TODO tags? tagbar
"TODO blockit
"TODO tab completion? Supertab?
"TODO ctrlp, file finder? command_T? nerd tree?
"TODO vim templates for LATEX
"TODO Surround.vim
"TODO Commentary? comment out?
"TODO repeat.vim?
"TODO relatedde
"TODO install virtualenv support https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"TODO
" Reference: https://www.youtube.com/watch?v=YhqsjUUHj6g&t=6s

"POLISH:
"TODO python.vim - get most current version?
"
"PRACTICE:
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
    "Tmux
    Plug 'christoomey/vim-tmux-navigator'

    "Sane Defaults
    Plug 'tpope/vim-sensible'
    "Formatting
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'junegunn/vim-easy-align' "TODO tutorial
    Plug 'tmhedberg/SimpylFold'
    "Syntax
"    Plug 'scrooloose/syntastic' "TODO tutorial

    "Filesystem
    Plug 'scrooloose/nerdtree' "TODO tutorial

    "Git
    Plug 'tpope/vim-fugitive' "TODO tutorial
    "Python
    Plug 'Valloric/YouCompleteMe' "TODO tutorial, install
    Plug 'vim-scripts/indentpython.vim' "TODO tutorial
    Plug 'nvie/vim-flake8' "TODO tutorial
    Plug 'stevefan/vim-ipython'

    "Color
    Plug 'jnurmine/Zenburn'
    Plug 'altercation/vim-colors-solarized'
    Plug 'tomasr/molokai'

    "Remote Action
    Plug 'zenbro/mirror.vim'
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
" set ruler
set relativenumber
set pastetoggle=<F2> " Better Copy and Paste
" Use "+yy to yank to plus register for pasting wuth xterm_clipboard
set clipboard=unnamedplus
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


" Toggle Relative/Nonrelative on Focus/NoFocus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" COLOR SCHEME:
if has('gui_running')
  set background=dark
  colorscheme zenburn_high_Contrast
else
  let g:zenburn_high_Contrast=0
  colorscheme zenburn
endif


" NAVAGATION COMMANDS:
" using vim-tmux-navigation plugin

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


" Begin Python Development:
" -------------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4 " for using >> or << commands
set shiftround
set expandtab
set autoindent "redundant for sensible
set fileformat=unix
autocmd BufRead,BufNewFile *.py let python_highlight_all=1
let g:ycm_python_binary_path = 'python' " active virtual_env aware

source ~/.vim/plugged/vim-ipython/ftplugin/python/ipy.vim
" -----------------------
" End Python Development:


" Full Stack Development:
" TODO:  https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/


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
