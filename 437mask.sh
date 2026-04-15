#!/bin/bash

# --- Configuration ---
# This is the base URL for your masked links.
# In a real application, this would point to a web server that handles redirects.
BASE_MASKED_URL="https://437.link"
TOOL_VERSION="1.0.0"

# --- Helper Functions ---

# Displays the main menu with ASCII art
display_menu() {
    clear
    echo "  _  _  __________                    _    "
    echo " | || ||___ /___  | __ ___   __ _ ___| | __"
    echo " | || |_ |_ \  / / '_ ` _ \ / _` / __| |/ /"
    echo " |__   _|__) |/ /| | | | | | (_| \__ \   < "
    echo "    |_||____//_/ |_| |_| |_|\__,_|___/_|\_\ "
    echo "      Tool created by Render            Version: ${TOOL_VERSION}                       "
    echo ""
    echo "1. Mask a URL"
    echo "2. Exit"
    echo "----------------------------------------"
}

# Generates a random hexadecimal string (simulating UUID)
# Uses standard bash features and utilities like shuf and fold
generate_random_alias() {
    # Get 8 random hex characters. 
    # /dev/urandom provides random bytes. tr converts them to hex.
    # head -c 16 gets 16 bytes of hex (8 bytes = 16 hex chars).
    # fold -w 8 wraps it to 8 chars, and head -n 1 takes the first line.
    # This is a common way to get random hex in bash without external tools.
    LC_ALL=C tr -dc 'a-f0-9' < /dev/urandom | head -c 8
}

# Prompts user for URL and validates it
get_url_input() {
    while true; do
        read -rp "Enter the URL you want to mask (e.g., https://example.com): " url
        # Basic URL validation using regex pattern matching
        if [[ "$url" =~ ^https?://[a-zA-Z0-9.-]+(\.[a-zA-Z]{2,})+(/[^[:space:]]*)?$ ]]; then
            echo "$url"
            return 0
        else
            echo "Invalid URL format. Please ensure it starts with http:// or https:// and is a valid web address."
        fi
    done
}

# Prompts user for a custom alias and validates it
get_custom_alias_input() {
    while true; do
        read -rp "Enter your desired custom alias (optional, press Enter to skip): " alias
        if [ -z "$alias" ]; then
            echo "" # Return empty for skipping
            return 0
        elif [[ "$alias" =~ ^[a-zA-Z0-9_-]+$ ]]; then
            echo "$alias"
            return 0
        else
            echo "Invalid alias. Aliases can only contain letters, numbers, hyphens, and underscores."
        fi
    done
}

# Main logic for masking a URL
mask_url() {
    local original_url
    local custom_alias
    local final_alias
    local masked_url

    original_url=$(get_url_input)
    
    custom_alias=$(get_custom_alias_input)

    if [ -z "$custom_alias" ]; then
        # Generate random alias if no custom one was provided
        final_alias=$(generate_random_alias)
        echo "Generating random alias..."
    else
        final_alias="$custom_alias"
        echo "Using custom alias..."
    fi
    
    masked_url="${BASE_MASKED_URL}/${final_alias}"

    echo ""
    echo "✅ Your masked URL is: ${masked_url}"
    echo ""
    echo "---"
    echo "Note: This is a simulated masked URL."
    echo "In a real application, '${BASE_MASKED_URL}/' would be a live service"
    echo "that redirects users to the original URL."
    echo "---"
    echo ""
}

# --- Main Script Execution ---

while true; do
    display_menu
    read -rp "Enter your choice (1-2): " choice

    case "$choice" in
        1)
            mask_url
            read -rp "Press Enter to return to the menu..."
            ;;
        2)
            echo "Exiting 437mask tool. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 1 or 2."
            read -rp "Press Enter to continue..."
            ;;
    esac
done
