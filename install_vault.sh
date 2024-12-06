#!/bin/bash

# Step 1: Add sourcing of init.sh to .bashrc
echo "Adding sourcing of init.sh to .bashrc..."
INIT_PATH="$(pwd)/init.sh"
if ! grep -Fxq "source $INIT_PATH" ~/.bashrc; then
    echo "source $INIT_PATH" >> ~/.bashrc
    echo "Sourcing of init.sh added to .bashrc."
else
    echo "Sourcing of init.sh already exists in .bashrc."
fi

# Step 2: Copy obsync to /usr/local/bin and make it executable
echo "Copying obsync to /usr/local/bin..."
sudo cp obsync /usr/local/bin/obsync
sudo chmod +x /usr/local/bin/obsync
echo "obsync script copied and made executable."

# Step 3: Add "obsync" alias to .bash_aliases
echo "Adding obsync alias to .bash_aliases..."
if ! grep -Fxq "alias obsync='/usr/local/bin/obsync'" ~/.bash_aliases; then
    echo "alias obsync='/usr/local/bin/obsync'" >> ~/.bash_aliases
    echo "Alias for obsync added to .bash_aliases."
else
    echo "Alias for obsync already exists in .bash_aliases."
fi

# Step 4: Create the .desktop file dynamically
echo "Generating obsync.desktop file..."
DESKTOP_FILE_CONTENT="[Desktop Entry]
Type=Application
Name=Obsidian Sync
Exec=bash -c \"source $INIT_PATH && /usr/local/bin/obsync\"
Icon=utilities-terminal
Terminal=true
Categories=Utility;
Comment=Sync Obsidian vault"
DESKTOP_FILE_PATH="$HOME/Desktop/obsync.desktop"

echo "$DESKTOP_FILE_CONTENT" > "$DESKTOP_FILE_PATH"
chmod +x "$DESKTOP_FILE_PATH"
echo "obsync.desktop created on Desktop."

# Step 5: Add to application launcher directory
echo "Copying obsync.desktop to application launcher..."
mkdir -p ~/.local/share/applications/
cp "$DESKTOP_FILE_PATH" ~/.local/share/applications/
echo "obsync.desktop added to application launcher."

echo "Installation completed! Please restart your terminal or run 'source ~/.bashrc' for the changes to take effect."

