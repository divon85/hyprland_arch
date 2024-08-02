# ------------------------------------------------------
# Install wallpapers
# ------------------------------------------------------
echo -e "${GREEN}"
figlet "Wallpapers"
if [ ! -d ~/Pictures ]; then
    mkdir Pictures
fi
echo -e "${NONE}"
if [ ! -d ~/Pictures/wallpaper ]; then
    echo "Do you want to download the wallpapers from repository https://github.com/mylinuxforwork/wallpaper/ ?"
    echo "If not, the script will install some default wallpapers in ~/wallpaper/"
    echo ""
    if gum confirm "Do you want to download the repository?" ;then
        if [ -d ~/Downloads/wallpaper ] ;then
            rm -rf ~/Downloads/wallpaper
        fi
        git clone --depth 1 https://github.com/mylinuxforwork/wallpaper.git ~/Downloads/wallpaper
        if [ ! -d ~/Pictures/wallpaper/ ]; then
            mkdir ~/Pictures/wallpaper
        fi
        rsync -a -I --exclude-from=install/includes/excludes.txt ~/Downloads/wallpaper/. ~/Pictures/wallpaper/
        echo "Wallpapers from the repository installed successfully."
    elif [ $? -eq 130 ]; then
        exit 130
    else
        if [ -d ~/Pictures/wallpaper/ ]; then
            echo "~/Pictures/wallpaper folder already exists."
        else
            mkdir ~/Pictures/wallpaper
        fi
        cp install/wallpapers/* ~/Pictures/wallpaper
        echo "Default wallpapers installed successfully."
    fi
else
    echo ":: ~/Pictures/wallpaper folder already exists."
fi
echo ""

# ------------------------------------------------------
# Copy default wallpaper files to .cache
# ------------------------------------------------------

# Cache file for holding the current wallpaper
cache_file="$HOME/.cache/current_wallpaper"
rasi_file="$HOME/.cache/current_wallpaper.rasi"

# Create cache file if not exists
if [ ! -f $cache_file ] ;then
    touch $cache_file
    echo "$HOME/Pictures/wallpaper/default.jpg" > "$cache_file"
fi

# Create rasi file if not exists
if [ ! -f $rasi_file ] ;then
    touch $rasi_file
    echo "* { current-image: url(\"$HOME/Pictures/wallpaper/default.jpg\", height); }" > "$rasi_file"
fi
