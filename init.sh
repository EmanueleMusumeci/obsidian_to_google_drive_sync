#!/bin/bash

# Obtain the path of the folder containing this script
export LITERATURE_SYNC_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export LITERATURE_VAULT_SYNC_PATH="${LITERATURE_SYNC_PATH}/Obsidian"

# Path to settings.conf
SETTINGS_FILE="${LITERATURE_SYNC_PATH}/settings.conf"

# Check if settings.conf exists
if [[ -f "$SETTINGS_FILE" ]]; then
    # Validate the file for proper variable definitions before sourcing
    while IFS='=' read -r key value; do
        case "$key" in
            REMOTE_NAME)
                export REMOTE_NAME="${value//\"/}" # Remove quotes if present
                ;;
            GDRIVE_FOLDER_NAME)
                export GDRIVE_FOLDER_NAME="${value//\"/}" # Remove quotes if present
                ;;
        esac
    done < "$SETTINGS_FILE"

    # Check if the required variables are set
    if [[ -z "$REMOTE_NAME" || -z "$GDRIVE_FOLDER_NAME" ]]; then
        echo "Error: REMOTE_NAME or GDRIVE_FOLDER_NAME is not set in settings.conf."
        exit 1
    fi
else
    echo "Error: settings.conf file not found in $LITERATURE_SYNC_PATH."
    echo "Please create the settings.conf file with REMOTE_NAME and GDRIVE_FOLDER_NAME variables."
    exit 1
fi

