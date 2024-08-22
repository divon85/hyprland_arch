# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
if gum confirm "DO YOU WANT TO START THE INSTALLATION NOW?" ;then
    echo "Installation started."
elif [ $? -eq 130 ]; then
    echo ":: Installation canceled."
    exit 130
else
    echo ":: Installation canceled."
    exit;
fi
echo ""
