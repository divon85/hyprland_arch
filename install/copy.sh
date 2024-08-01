# ------------------------------------------------------
# Copy dotfiles
# ------------------------------------------------------
if [ ! -d ~/.config ]; then
echo -e "${GREEN}"
figlet "Installation"
echo -e "${NONE}"
else
echo -e "${GREEN}"
figlet "Update"
echo -e "${NONE}"
fi
if [ ! -d ~/.config ]; then
echo "The script will now remove existing directories and files from ~/.config/"
echo "and copy your prepared configuration from ~/.backup-versions/$version to ~/.config"
echo
echo "Symbolic links will then be created from ~/.config into your ~/.config/ directory."
echo
fi
if [[ ! $(tty) == *"pts"* ]] && [ -d ~/.config ]; then
    echo "You're running the script in tty. You can delete the existing ~/.config folder now for a clean installation."
    echo "If not, the script will overwrite existing files but will not remove additional files or folders of your custom configuration."
    echo
else
    if [ -d ~/.config ]; then
        echo "The script will overwrite existing files but will not remove additional files or folders from your custom configuration."
        echo
    fi
fi
if [ ! -d ~/.config ]; then
    echo "PLEASE BACKUP YOUR EXISTING CONFIGURATIONS in .config IF NEEDED!"
    echo
fi

if gum confirm "Do you want to install the prepared dotfiles now?" ;then
    if [ ! $mode == "dev" ]; then
        echo "Copy started"
        if [ ! -d ~/.config ]; then
            mkdir ~/.config
            echo "~/.config folder created."
        fi   
        rsync -avhp -I ~/.backup-versions/$version/ ~/.config/
        if [[ $(_isFolderEmpty ~/.config/) == 0 ]] ;then
            echo "AN ERROR HAS OCCURED. Copy prepared dofiles from ~/.backup-versions/$version/ to ~/.config/ failed" 
            echo "Please check that rsync is installad on your system."
            echo "Execution of rsync -a -I ~/.backup-versions/$version/ ~/.config/ is required."
            exit
        fi
        echo "All files from ~/.backup-versions/$version/ to ~/.config/ copied."
    else
        echo "Skipped: DEV MODE!"
    fi
elif [ $? -eq 130 ]; then
    echo ":: Installation canceled"
    exit 130
else
    echo ":: Installation canceled"
    exit
fi
echo
