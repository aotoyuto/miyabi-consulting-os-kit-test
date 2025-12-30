#!/usr/bin/env bash
set -euo pipefail

# 事前条件: gh auth login 済み
# 使い方: bash scripts/github/bootstrap_labels.sh <owner/repo>
REPO="${1:?Usage: bootstrap_labels.sh owner/repo}"

create_label () {
  local name="$1"
  local color="$2"
  local desc="$3"
  gh label create "$name" --repo "$REPO" --color "$color" --description "$desc" --force
}

# Type
create_label "type:intake" "0E8A16" "Request intake"
create_label "type:research" "1D76DB" "Research task"
create_label "type:deliverable" "5319E7" "Deliverable"
create_label "type:decision" "B60205" "Decision needed"

# State
create_label "state:backlog" "C5DEF5" "Backlog"
create_label "state:doing" "FBCA04" "In progress"
create_label "state:review" "D4C5F9" "Review"
create_label "state:blocked" "E99695" "Blocked"
create_label "state:done" "0E8A16" "Done"

# Role
create_label "role:🔴decision-needed" "B60205" "Needs decision"
create_label "role:🔵exec" "0052CC" "Execution"
create_label "role:🟡review" "FBCA04" "Review"

# Priority
create_label "prio:P0" "B60205" "Critical"
create_label "prio:P1" "D93F0B" "High"
create_label "prio:P2" "FBCA04" "Medium"
create_label "prio:P3" "C2E0C6" "Low"

# Risk
create_label "risk:security" "B60205" "Security risk"
create_label "risk:data" "D93F0B" "Data risk"
create_label "risk:none" "C2E0C6" "No special risk"

echo "✅ Labels created/updated for $REPO"
