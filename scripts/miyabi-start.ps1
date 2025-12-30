param(
    [string]$Issue,
    [string]$Base = "main"
)

if (git status --porcelain) {
    Write-Host "Error: There are uncommitted changes. Please commit or stash your changes before running the script."
    exit 1
}

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "Error: gh (GitHub CLI) is not installed. Please install it from https://cli.github.com/ and run 'gh auth login'."
    exit 1
}

$TITLE = try {
    gh issue view "$Issue" --json title -q .title 2>$null
} catch {
    "issue-$Issue"
}

$SLUG = $TITLE -replace ' ', '-' -replace '[^a-zA-Z0-9-]', '' | ForEach-Object { $_.ToLower() } | ForEach-Object { $_.Substring(0, [System.Math]::Min($_.Length, 50)) }
$BRANCH = "issue-$Issue-$SLUG"

git fetch origin 2>$null
git switch "$Base"
git pull --rebase

git switch $BRANCH 2>$null
if ($LASTEXITCODE -ne 0) {
    git switch -c $BRANCH
}

New-Item -ItemType Directory -Path ".worktrees" -ErrorAction SilentlyContinue
git worktree add ".worktrees/$BRANCH" "$BRANCH" 2>$null

Write-Host "Branch created: $BRANCH"
Write-Host "Next step: cd .worktrees/$BRANCH"
