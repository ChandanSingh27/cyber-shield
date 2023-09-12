#!/bin/bash

# Define variables for Snort rule URLs and paths
SNORT_RULES_URL="https://www.snort.org/downloads/community/community-rules.tar.gz"
SNORT_RULES_DIR="/etc/snort/rules"
SNORT_CONF_FILE="/etc/snort/snort.conf"

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Download Snort rules
echo "Downloading Snort rules..."
wget -O /tmp/community-rules.tar.gz "$SNORT_RULES_URL"

# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Failed to download Snort rules. Exiting."
  exit 1
fi

# Extract the rules to the Snort rules directory
echo "Extracting Snort rules..."
tar -xzvf /tmp/community-rules.tar.gz -C "$SNORT_RULES_DIR"

# Update the Snort configuration file to include the new rules
echo "Updating Snort configuration..."
#sed -i "/^include \$RULE_PATH\/local.rules/a include \$RULE_PATH\/community.rules" "$SNORT_CONF_FILE"

# Restart Snort to apply the changes
echo "Restarting Snort..."
service snort restart

# Clean up temporary files
rm -f /tmp/community-rules.tar.gz

echo "Snort rules have been downloaded and configured successfully."