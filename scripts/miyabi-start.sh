#!/usr/bin/env bash
set -euo pipefail

ISSUE="${1:?Usage: miyabi-start.sh <issue_number> [base_branch]}"
BASE="${2:-main}"

if ! command -v gh >/dev/null 2>&1; then
  echo "gh (GitHub CLI) が必要です。https://cli.github.com/ を参照し、gh auth login してください。"
  exit 1
fi

TITLE="$(gh issue view "$ISSUE" --json title -q .title 2>/dev/null || echo "issue-$ISSUE")"
SLUG="$(echo "$TITLE" | tr ' ' '-' | tr -cd '[:alnum:]-' | tr '[:upper:]' '[:lower:]' | cut -c1-50)"
BRANCH="issue-${ISSUE}-${SLUG}"

git fetch origin >/dev/null 2>&1 || true
git switch "$BASE"
git pull --rebase

git switch -c "$BRANCH" || git switch "$BRANCH"

mkdir -p .worktrees
git worktree add ".worktrees/$BRANCH" "$BRANCH" >/dev/null 2>&1 || true

echo "✅ branch: $BRANCH"
echo "➡️  next: cd .worktrees/$BRANCH"
