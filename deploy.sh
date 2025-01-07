#!/bin/bash
# deploy.sh: Deploys documentation from jekwwer/common-docs GitHub release to a target directory

# Ensure dependencies are installed
command -v yq >/dev/null 2>&1 || { echo >&2 "yq is required but not installed. Install it: https://github.com/mikefarah/yq"; exit 1; }
command -v curl >/dev/null 2>&1 || { echo >&2 "curl is required but not installed. Install it via your package manager."; exit 1; }
command -v unzip >/dev/null 2>&1 || { echo >&2 "unzip is required but not installed. Install it via your package manager."; exit 1; }

# Check for arguments
CONFIG_FILE="config.yml"
TARGET_DIR=""
REPO_OWNER="Jekwwer"
REPO_NAME="common-docs"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --config) CONFIG_FILE="$2"; shift ;;
        --target) TARGET_DIR="$2"; shift ;;
        --repo-owner) REPO_OWNER="$2"; shift ;;
        --repo-name) REPO_NAME="$2"; shift ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
    shift
done

# Validate arguments
if [[ -z "$TARGET_DIR" ]]; then
    echo "Usage: $0 --target <target_directory> [--config <config_file>] [--repo-owner <owner>] [--repo-name <name>]"
    exit 1
fi

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Configuration file '$CONFIG_FILE' not found!"
    exit 1
fi

# Fetch the latest release from the GitHub API
echo "Fetching the latest release from $REPO_OWNER/$REPO_NAME..."
LATEST_RELEASE=$(curl -s "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/latest" | yq eval '.tag_name' -)
DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/latest" | yq eval '.assets[0].browser_download_url' -)

if [[ -z "$LATEST_RELEASE" || -z "$DOWNLOAD_URL" ]]; then
    echo "Failed to fetch the latest release information."
    exit 1
fi

echo "Latest release: $LATEST_RELEASE"
echo "Downloading documentation from $DOWNLOAD_URL..."

# Download and unzip the latest release
TEMP_DIR=$(mktemp -d)
ZIP_FILE="$TEMP_DIR/docs.zip"

curl -L -o "$ZIP_FILE" "$DOWNLOAD_URL"
unzip -q "$ZIP_FILE" -d "$TEMP_DIR"

# Function to escape special characters for sed
escape_sed() {
    echo "$1" | sed -e 's/[\/&]/\\&/g'
}

# Read and escape values from config.yml
YEAR_RANGE=$(escape_sed "$(yq eval '.year_range' "$CONFIG_FILE")")
AUTHOR_NAME=$(escape_sed "$(yq eval '.author_name' "$CONFIG_FILE")")
CONTACT_EMAIL=$(escape_sed "$(yq eval '.contact_email' "$CONFIG_FILE")")
REPORT_EMAIL=$(escape_sed "$(yq eval '.report_email' "$CONFIG_FILE")")
GITHUB_USERNAME=$(escape_sed "$(yq eval '.github_username' "$CONFIG_FILE")")
BUY_ME_A_COFFEE_USERNAME=$(escape_sed "$(yq eval '.buy_me_a_coffee_username' "$CONFIG_FILE")")
KO_FI_USERNAME=$(escape_sed "$(yq eval '.ko_fi_username' "$CONFIG_FILE")")
LIBERAPAY_USERNAME=$(escape_sed "$(yq eval '.liberapay_username' "$CONFIG_FILE")")
OPEN_COLLECTIVE_USERNAME=$(escape_sed "$(yq eval '.open_collective_username' "$CONFIG_FILE")")
PATREON_USERNAME=$(escape_sed "$(yq eval '.patreon_username' "$CONFIG_FILE")")
SECURITY_URL=$(escape_sed "$(yq eval '.security_url' "$CONFIG_FILE")")
CONTRIBUTING_URL=$(escape_sed "$(yq eval '.contributing_url' "$CONFIG_FILE")")
DISCUSSIONS_URL=$(escape_sed "$(yq eval '.discussions_url' "$CONFIG_FILE")")
REPO_NAME=$(escape_sed "$(yq eval '.repo_name' "$CONFIG_FILE")")
RESPONSE_TIME=$(escape_sed "$(yq eval '.response_time' "$CONFIG_FILE")")
RESOLUTION_TIME=$(escape_sed "$(yq eval '.resolution_time' "$CONFIG_FILE")")

# Replace placeholders in downloaded files and preserve folder structure
find "$TEMP_DIR" -type f -name "*.md" -o -name "*.yml" -o -name "LICENSE.template" | while read -r FILE; do
    REL_PATH="${FILE#$TEMP_DIR/}"  # Get relative path
    OUTPUT_FILE="$TARGET_DIR/$REL_PATH"

    # Ensure target directory exists
    mkdir -p "$(dirname "$OUTPUT_FILE")"

    # Replace placeholders and write to the target file
    sed \
        -e "s/{[[:space:]]*{[[:space:]]*YEAR_RANGE[[:space:]]*}[[:space:]]*}/$YEAR_RANGE/g" \
        -e "s/{[[:space:]]*{[[:space:]]*AUTHOR_NAME[[:space:]]*}[[:space:]]*}/$AUTHOR_NAME/g" \
        -e "s/{[[:space:]]*{[[:space:]]*CONTACT_EMAIL[[:space:]]*}[[:space:]]*}/$CONTACT_EMAIL/g" \
        -e "s/{[[:space:]]*{[[:space:]]*REPORT_EMAIL[[:space:]]*}[[:space:]]*}/$REPORT_EMAIL/g" \
        -e "s/{[[:space:]]*{[[:space:]]*GITHUB_USERNAME[[:space:]]*}[[:space:]]*}/$GITHUB_USERNAME/g" \
        -e "s/{[[:space:]]*{[[:space:]]*BUY_ME_A_COFFEE_USERNAME[[:space:]]*}[[:space:]]*}/$BUY_ME_A_COFFEE_USERNAME/g" \
        -e "s/{[[:space:]]*{[[:space:]]*KO_FI_USERNAME[[:space:]]*}[[:space:]]*}/$KO_FI_USERNAME/g" \
        -e "s/{[[:space:]]*{[[:space:]]*LIBERAPAY_USERNAME[[:space:]]*}[[:space:]]*}/$LIBERAPAY_USERNAME/g" \
        -e "s/{[[:space:]]*{[[:space:]]*OPEN_COLLECTIVE_USERNAME[[:space:]]*}[[:space:]]*}/$OPEN_COLLECTIVE_USERNAME/g" \
        -e "s/{[[:space:]]*{[[:space:]]*PATREON_USERNAME[[:space:]]*}[[:space:]]*}/$PATREON_USERNAME/g" \
        -e "s/{[[:space:]]*{[[:space:]]*SECURITY_URL[[:space:]]*}[[:space:]]*}/$SECURITY_URL/g" \
        -e "s/{[[:space:]]*{[[:space:]]*CONTRIBUTING_URL[[:space:]]*}[[:space:]]*}/$CONTRIBUTING_URL/g" \
        -e "s/{[[:space:]]*{[[:space:]]*DISCUSSIONS_URL[[:space:]]*}[[:space:]]*}/$DISCUSSIONS_URL/g" \
        -e "s/{[[:space:]]*{[[:space:]]*REPO_NAME[[:space:]]*}[[:space:]]*}/$REPO_NAME/g" \
        -e "s/{[[:space:]]*{[[:space:]]*RESPONSE_TIME[[:space:]]*}[[:space:]]*}/$RESPONSE_TIME/g" \
        -e "s/{[[:space:]]*{[[:space:]]*RESOLUTION_TIME[[:space:]]*}[[:space:]]*}/$RESOLUTION_TIME/g" \
        -e "s/{[[:space:]]*{[[:space:]]*LATEST_VERSION[[:space:]]*}[[:space:]]*}/$LATEST_VERSION/g" \
        -e "s/{[[:space:]]*{[[:space:]]*PREVIOUS_VERSION[[:space:]]*}[[:space:]]*}/$PREVIOUS_VERSION/g" \
        "$FILE" > "$OUTPUT_FILE"
done

# Rename LICENSE.template to LICENSE if no LICENSE exists in the target directory
if [[ ! -f "$TARGET_DIR/LICENSE" && -f "$TARGET_DIR/LICENSE.template" ]]; then
    echo "No LICENSE found. Renaming LICENSE.template to LICENSE."
    mv "$TARGET_DIR/LICENSE.template" "$TARGET_DIR/LICENSE"
fi

# Clean up
rm -rf "$TEMP_DIR"

echo "Documentation successfully deployed to $TARGET_DIR"
