# Obsidian to Google Drive Synchronization
Bash script setup for Linux to synchronize your Obsidian vault with your Google Drive through rclone.

### Credits
[This guide](https://medium.com/@gintarasan/saving-money-syncing-obsidian-with-google-drive-in-ubuntu-22-04-c5a8137c207d)

# Setup 

1) Set up a folder on your Google Drive (this is where your Obsidian Vault will live)
2) Make sure Rclone is installed on your computer or follow [this guide](https://rclone.org/downloads/).
3) Connect Rclone with your Google Drive as documented [here](https://rclone.org/drive/)
4) In `settings.conf` replace `YourRemoteName` with the name of the remote from step (3) and `YourFolderName` with the name of the Google Drive folder from step (1)
5) Run the `install_vault.sh` script here
6) Close the current terminal and open a new one

You will now have a new desktop icon to run
