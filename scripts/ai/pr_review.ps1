param(
    [string]$base_ref = "origin/main"
)

git fetch origin 2>$null
$diff = git diff "${base_ref}...HEAD"

if (-not $diff) {
    '{"summary":"No changes detected","risks":[],"missing_checks":[],"suggested_tasks":[]}' | Set-Content -Path "ai_review.json"
    exit 0
}

$diff | claude -p --append-system-prompt "あなたは厳格なレビュワー。危険変更、設計崩れ、テスト不足、抜け漏れを検出し、JSONで返す。keys: summary, risks[], missing_checks[], suggested_tasks[]。" --output-format json --allowedTools "Read" | Set-Content -Path "ai_review.json"
