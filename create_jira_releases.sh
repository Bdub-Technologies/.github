#!/bin/bash

JIRA_BASE_URL="https://boilingwaters.atlassian.net"
JIRA_PROJECT_KEY="BDUB"
JIRA_EMAIL="jeth@boilingwaters.ph"  # Change this to your JIRA email if different
JIRA_TOKEN="$JIRA_API_TOKEN"

# Get project ID
echo "Getting project ID for $JIRA_PROJECT_KEY..."
PROJECT_RESPONSE=$(curl -s -u "$JIRA_EMAIL:$JIRA_TOKEN" \
  -H "Accept: application/json" \
  "$JIRA_BASE_URL/rest/api/3/project/$JIRA_PROJECT_KEY")

PROJECT_ID=$(echo "$PROJECT_RESPONSE" | jq -r '.id')
echo "Project ID: $PROJECT_ID"

# Create Prod release
echo "Creating Prod - 2026-03 release..."
curl -s -X POST \
  -u "$JIRA_EMAIL:$JIRA_TOKEN" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  "$JIRA_BASE_URL/rest/api/3/version" \
  -d "{
    \"name\": \"Prod - 2026-03\",
    \"projectId\": $PROJECT_ID,
    \"description\": \"## Current Versions\n\n| Service | Version | Deployed |\n|---------|---------|----------|\"
  }" | jq .

# Create Dev release
echo "Creating Dev - 2026-03 release..."
curl -s -X POST \
  -u "$JIRA_EMAIL:$JIRA_TOKEN" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  "$JIRA_BASE_URL/rest/api/3/version" \
  -d "{
    \"name\": \"Dev - 2026-03\",
    \"projectId\": $PROJECT_ID,
    \"description\": \"## Current Versions\n\n| Service | Version | Deployed |\n|---------|---------|----------|\"
  }" | jq .

echo "Done!"
