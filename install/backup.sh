#!/usr/bin/env sh

# ------------------------------------------------------
# Backup existing dotfiles
# ------------------------------------------------------

datets=$(date '+%Y%m%d%H%M%S')

# Create Backup File Structure

if [ ! -d ~/.backup-versions ]; then
    mkdir ~/.backup-versions
    echo "~/.backup-versions created."
fi
if [ ! -d ~/.backup-versions/backup ]; then
    mkdir ~/.backup-versions/backup
    echo "~/.backup-versions/backup created"
fi
if [ -d ~/.backup-versions/backups ]; then
    mv ~/.backup-versions/backups ~/.backup-versions/archive
    echo ":: Existing backups moved into ~/.backup-versions/archive"
fi
if [ ! -d ~/.backup-versions/archive ]; then
    mkdir ~/.backup-versions/archive
    echo "~/.backup-versions/archive created"
fi

# Backup Existing Dotfiles

if [ -d ~/.backup ] || ! test -L ~/.bashrc || [ -d ~/.config/hypr ] || [ -d ~/.config/qtile ]; then

    echo -e "${GREEN}"
    figlet "Backup"
    echo -e "${NONE}"
    echo "The script has detected the following files and folders for a backup:"

    if [ -d ~/.backup ]; then
        echo "   - $HOME/.backup"
    fi
    if ! test -L ~/.bashrc ;then
        echo "   - $HOME/.bashrc"
    fi
    if ! test -L ~/.config/qtile && [ -d ~/.config/qtile ] ;then
        echo "   - $HOME/.config/qtile/"
    fi
    if ! test -L ~/.config/hypr && [ -d ~/.config/hypr ] ;then
        echo "   - $HOME/.config/hypr/"
    fi
    if ! test -L ~/.config/ml4w-hyprland-settings && [ -d ~/.config/ml4w-hyprland-settings ] ;then
        echo "   - $HOME/.config/ml4w-hyprland-settings/"
    fi
    if ! test -L ~/.config/rofi && [ -d ~/.config/rofi ] ;then
        echo "   - $HOME/.config/rofi/"
    fi
    if ! test -L ~/.config/wal && [ -d ~/.config/wal ] ;then
        echo "   - $HOME/.config/wal/"
    fi
    if ! test -L ~/.config/waybar && [ -d ~/.config/waybar ] ;then
        echo "   - $HOME/.config/waybar/"
    fi
    if ! test -L ~/.config/wlogout && [ -d ~/.config/wlogout ] ;then
        echo "   - $HOME/.config/wlogout/"
    fi
    if ! test -L ~/.config/alacritty && [ -d ~/.config/alacritty ] ;then
        echo "   - $HOME/.config/alacritty/"
    fi
    if ! test -L ~/.config/starship && [ -d ~/.config/starship ] ;then
        echo "   - $HOME/.config/starship/"
    fi
    if ! test -L ~/.config/picom && [ -d ~/.config/picom ] ;then
        echo "   - $HOME/.config/picom/"
    fi
    if ! test -L ~/.config/nvim && [ -d ~/.config/nvim ] ;then
        echo "   - $HOME/.config/nvim/"
    fi
    if ! test -L ~/.config/vim && [ -d ~/.config/vim ] ;then
        echo "   - $HOME/.config/vim/"
    fi
    if ! test -L ~/.config/dunst && [ -d ~/.config/dunst ] ;then
        echo "   - $HOME/.config/dunst/"
    fi
    if ! test -L ~/.config/swappy && [ -d ~/.config/swappy ] ;then
        echo "   - $HOME/.config/swappy/"
    fi
    echo 
    # Start Backup

    if gum confirm "Do you want to create a backup?" ;then

        if [ ! -z "$(ls -A ~/.backup-versions/backup)" ] ;then
            if gum confirm "Do you want to archive the existing backup?" ;then
                rsync -a ~/.backup-versions/backup/ ~/.backup-versions/archive/$datets/
                echo ":: Current backup archived in ~/.backup-versions/archive/$datets"
            fi
        fi
        if [ -d ~/.backup ]; then
            rsync -a ~/.backup ~/.backup-versions/backup/
            echo ":: Backup of $HOME/.backup created in ~/.backup-versions/backup"
        fi
        if ! test -L ~/.bashrc ;then
            cp ~/.bashrc ~/.backup-versions/backup
            echo ":: Backup of $HOME/.bashrc created in ~/.backup-versions/backup"
        fi
        if [ ! -d ~/.backup-versions/backup/config ] ;then
            mkdir ~/.backup-versions/backup/config
        fi
        if ! test -L ~/.config/qtile && [ -d ~/.config/qtile ] ;then
            cp -r ~/.config/qtile ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/qtile created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/hypr && [ -d ~/.config/hypr ] ;then
            cp -r ~/.config/hypr ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/hypr created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/ml4w-hyprland-settings && [ -d ~/.config/ml4w-hyprland-settings ] ;then
            cp -r ~/.config/ml4w-hyprland-settings ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/ml4w-hyprland-settings created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/qtile && [ -d ~/.config/rofi ] ;then
            cp -r ~/.config/rofi ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/rofi created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/wal && [ -d ~/.config/wal ] ;then
            cp -r ~/.config/wal ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/wal created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/waybar && [ -d ~/.config/waybar ] ;then
            cp -r ~/.config/waybar ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/waybar created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/wlogout && [ -d ~/.config/wlogout ] ;then
            cp -r ~/.config/wlogout ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/wlogout created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/alacritty && [ -d ~/.config/alacritty ] ;then
            cp -r ~/.config/alacritty ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/alacritty created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/starship && [ -d ~/.config/starship ] ;then
            cp -r ~/.config/starship ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/starship created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/picom && [ -d ~/.config/picom ] ;then
            cp -r ~/.config/picom ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/picom created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/nvim && [ -d ~/.config/nvim ] ;then
            cp -r ~/.config/nvim ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/nvim created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/vim && [ -d ~/.config/vim ] ;then
            cp -r ~/.config/vim ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/vim created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/dunst && [ -d ~/.config/dunst ] ;then
            cp -r ~/.config/dunst ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/dunst created in ~/.backup-versions/backup/config/"
        fi
        if ! test -L ~/.config/swappy && [ -d ~/.config/swappy ] ;then
            cp -r ~/.config/swappy ~/.backup-versions/backup/config
            echo ":: Backup of $HOME/.config/swappy created in ~/.backup-versions/backup/config/"
        fi        
    elif [ $? -eq 130 ]; then
        exit 130
    else
        echo ":: Backup skipped."
    fi
else
    echo ":: Nothing to backup"
fi
echo