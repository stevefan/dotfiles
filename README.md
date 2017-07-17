# dotfiles

To deploy your dot files on a new machine run:

`git clone https://github.com/your_username/dotfiles.git && source ~/dotfiles/install-dotfiles.sh`

Installation creates symlinks in $HOME to all files in the dotfiles folder except those those listed in excluded_files. 

If a dotfile exists prior to the script execuiting, the script will mv it to the old_dotfiles directory, the contents of which are gitignored.

