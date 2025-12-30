#!/usr/bin/env bash
set -euo pipefail

payload="$(cat 2>/dev/null || true)"

# Claude Code hooks input uses JSON; for UserPromptSubmit there is usually `user_prompt`.
# Rule: require CLIENT + ISSUE marker to avoid multi-client mixing.
prompt="$(echo "$payload" | python - <<'PY'
import json,sys
s=sys.stdin.read()
try:
    j=json.loads(s) if s.strip() else {}
except Exception:
    j={}
print(j.get("user_prompt","") or j.get("prompt","") or "")
PY
)"

if echo "$prompt" | grep -qiE 'CLIENT\s*:' && echo "$prompt" | grep -qiE 'ISSUE\s*:'; then
  echo '{"continue": true, "suppressOutput": true}'
  exit 0
fi

echo '{
  "continue": false,
  "stopReason": "混線防止のため、プロンプトに CLIENT: と ISSUE: を必ず含めてください（例：CLIENT:Acme / ISSUE:#123）。",
  "suppressOutput": true
}'
