#!/usr/bin/env bash
set -euo pipefail

ISSUE="${1:?Usage: miyabi-finish.sh <issue_number>}"

if ! command -v gh >/dev/null 2>&1; then
  echo "gh (GitHub CLI) が必要です。https://cli.github.com/ を参照し、gh auth login してください。"
  exit 1
fi

# Optional: AI review (headless) if claude CLI is available
if command -v claude >/dev/null 2>&1; then
  bash scripts/ai/pr_review.sh origin/main || true
else
  echo "ℹ️ claude CLI が見つかりません。AIレビューはスキップします。"
fi

# Create PR
gh pr create --fill --title "Issue #$ISSUE" --body-file .github/pull_request_template.md || true

echo "✅ PR created/updated. Link related Issue (#$ISSUE) in PR if needed."
