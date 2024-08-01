# ------------------------------------------------------
# Prepare dotfiles
# ------------------------------------------------------
echo -e "${GREEN}"
figlet "Preparation"
echo -e "${NONE}"

# Check existing .config folder
if [ -d ~/.config ]; then
    echo ":: $HOME/.config folder already exists."
else
    mkdir ~/.config
    echo ":: $HOME/.config folder created."
fi
echo

# Copy files to the destination
rsync -a -I --exclude-from=install/includes/excludes.txt dotfiles/. ~/.backup-versions/$version/

# Check copy success
if [[ $(_isFolderEmpty ~/backup-versions/$version/) == 0 ]] ;then
    echo "AN ERROR HAS OCCURED. Preparation of ~/.backup-versions/$version/ failed" 
    echo "Please check that rsync is installad on your system."
    echo "Execution of rsync -a -I --exclude-from=install/includes/excludes.txt . ~/.backup-versions/$version/ is required."
    exit
fi
echo ":: The dotfiles successfully prepared in ~/.backup-versions/$version/"

# Copy hook.tpl if hook.sh not exists
if [ ! -f ~/.backup-versions/hook.sh ] ;then
    cp install/templates/hook.tpl ~/.backup-versions/
    echo ":: hook.tpl created"
else
    chmod +x ~/.backup-versions/hook.sh
    echo ":: hook.sh already exists"
fi

# Copy post.tpl if post.sh not exists
if [ ! -f ~/.backup-versions/post.sh ] ;then
    cp install/templates/post.tpl ~/.backup-versions/
    echo ":: post.tpl created"
else
    chmod +x ~/.backup-versions/post.sh
    echo ":: post.sh already exists"
fi

# Prepare library folder
cp install/includes/scripts.sh ~/.backup-versions/library/
echo ":: scripts.sh for $version updated in ~/.backup-versions/library"
if [ ! -f ~/.backup-versions/library/version.sh ] ;then
    touch ~/.backup-versions/library/version.sh
fi
echo "$version" > ~/.backup-versions/library/version.sh
echo ":: version.sh updated with $version"