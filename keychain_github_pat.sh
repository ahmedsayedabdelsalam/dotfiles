#!/bin/bash

# Variables: Customize these
SERVICE="github_pat"        # Keychain service name
ACCOUNT="GITHUB_PAT"        # Account name (identifier)
TOKEN="$1"                   # Token passed as a script argument

# Function to print usage instructions
usage() {
  echo "Usage: $0 <GITHUB_PERSONAL_ACCESS_TOKEN>"
  exit 1
}

# Check if the token is provided as an argument
if [ -z "$TOKEN" ]; then
  echo "Error: Token is required."
  usage
fi

# Delete existing keychain item (if it exists)
echo "Checking for existing Keychain entry..."
security delete-generic-password -s "$SERVICE" -a "$ACCOUNT" 2>/dev/null

# Add the new token to Keychain
echo "Adding new token to Keychain..."
security add-generic-password -a "$ACCOUNT" -s "$SERVICE" -w "$TOKEN"

# Confirm the operation
if [ $? -eq 0 ]; then
  echo "Token successfully added to Keychain!"
else
  echo "Failed to add token to Keychain."
  exit 1
fi

