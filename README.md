# Bdub Technologies - Shared GitHub Workflows

This repository contains reusable GitHub Actions workflows shared across all Bdub Technologies repositories.

## Workflows

### post-deploy-notify.yml

Reusable workflow for notifying JIRA and Slack after a deployment.

**Usage:**

```yaml
notify:
  uses: Bdub-Technologies/.github/.github/workflows/post-deploy-notify.yml@main
  with:
    service: bw-dating-chat
    version: 1.2.3
    environment: prod
    changelog: |
      - feat: add typing indicators
      - fix: connection timeout
  secrets: inherit
```

**Inputs:**

- `service` (required): Service name (e.g., `bw-dating-chat`)
- `version` (required): Version being deployed (e.g., `1.2.3`)
- `environment` (required): Environment (`dev` or `prod`)
- `changelog` (optional): Release notes / changelog

**Secrets Required:**

- `JIRA_API_TOKEN` - JIRA API token (from Atlassian)
- `JIRA_EMAIL` - JIRA account email
- `SLACK_BOT_TOKEN` - Slack bot token

**Variables Required:**

- `JIRA_BASE_URL` - JIRA instance URL (e.g., `https://yourcompany.atlassian.net`)
- `JIRA_PROJECT_KEY` - JIRA project key (e.g., `BDUB`)
- `SLACK_CHANNEL_ID` - Slack channel ID for notifications

## Setup

1. Add secrets to each repository:
   - `JIRA_API_TOKEN`
   - `JIRA_EMAIL`
   - `SLACK_BOT_TOKEN`

2. Add variables to each repository:
   - `JIRA_BASE_URL`
   - `JIRA_PROJECT_KEY`
   - `SLACK_CHANNEL_ID`

3. Reference the workflow in your deploy workflow as shown in the usage example above.
