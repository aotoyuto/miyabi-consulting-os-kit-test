# Miyabi-style Consulting OS Kit (GitHub as OS + Claude Code)

## Directory Overview

This directory is a template for managing consulting projects, leveraging GitHub as the single source of truth and an AI assistant (Claude) for code-related tasks. It provides a structured workflow, scripts, and guardrails to ensure consistency, safety, and speed across multiple client projects.

The core idea is to use GitHub Issues for task management, Pull Requests for deliverables, and GitHub Actions for automated AI reviews.

## Key Files

*   `README.md`: The main documentation, explaining the project's purpose, setup, and workflow.
*   `scripts/miyabi-start.sh`: A script to start a new task. It creates a new Git branch from a specified GitHub Issue. (Unix-like systems)
*   `scripts/miyabi-start.ps1`: A PowerShell script to start a new task. It creates a new Git branch from a specified GitHub Issue. (Windows)
*   `scripts/miyabi-finish.sh`: A script to finish a task. It runs an optional AI review and creates a Pull Request. (Unix-like systems)
*   `scripts/miyabi-finish.ps1`: A PowerShell script to finish a task. It creates a Pull Request. (Windows)
*   `.github/workflows/ai_review.yml`: A GitHub Actions workflow that automatically runs an AI review on every Pull Request.
*   `scripts/ai/pr_review.sh`: A script that generates a diff of the changes and uses the `claude` CLI to perform an AI review. (Unix-like systems)
*   `scripts/ai/pr_review.ps1`: A PowerShell script that generates a diff of the changes and uses the `claude` CLI to perform an AI review. (Windows)
*   `.claude/hooks/`: A directory containing guardrail scripts to prevent the AI from performing dangerous actions.
*   `docs/decisions/`: A directory to store Architectural Decision Records (ADRs).
*   `Makefile`: Contains commands for common tasks:
    *   `make ai-review`: Runs the AI review script.
    *   `make labels`: Prints instructions for bootstrapping GitHub labels.
    *   `make decision-to-adr`: Prints instructions for converting a decision issue to an ADR.

## Usage

This directory is intended to be used as a template for new projects. The workflow is as follows:

1.  A new task is received as a GitHub Issue.
2.  The `scripts/miyabi-start.sh` script is used to create a new branch for the task.
3.  Work is done on the new branch.
4.  The `scripts/miyabi-finish.sh` script is used to create a Pull Request.
5.  An AI review is automatically triggered on the Pull Request.
6.  Decisions are documented in the `docs/decisions/` directory.

## GitHub Labels

The `scripts/github/bootstrap_labels.sh` script creates a set of labels in the GitHub repository to help manage issues and pull requests. The labels are organized into the following categories:

*   **Type:** `type:intake`, `type:research`, `type:deliverable`, `type:decision`
*   **State:** `state:backlog`, `state:doing`, `state:review`, `state:blocked`, `state:done`
*   **Role:** `role:🔴decision-needed`, `role:🔵exec`, `role:🟡review`
*   **Priority:** `prio:P0`, `prio:P1`, `prio:P2`, `prio:P3`
*   **Risk:** `risk:security`, `risk:data`, `risk:none`

## Changelog

*   **2025-12-22:** Modified `scripts/miyabi-start.sh` to remove `|| true` from the `git pull --rebase` command. This makes the script more robust by ensuring that it will exit if the rebase fails.
*   **2025-12-22:** Analyzed the `Makefile` and added a description of its commands to the "Key Files" section in `GEMINI.md`.
*   **2025-12-22:** Analyzed the `scripts/github/bootstrap_labels.sh` script and added a "GitHub Labels" section to `GEMINI.md` to document the labels.
*   **2025-12-22:** Created `scripts/miyabi-start.ps1`, a PowerShell version of the `miyabi-start.sh` script, to support Windows environments.
*   **2025-12-22:** Created `scripts/miyabi-finish.ps1`, a PowerShell version of the `miyabi-finish.sh` script, to support Windows environments.
*   **2025-12-22:** Created `scripts/ai/pr_review.ps1`, a PowerShell version of the `scripts/ai/pr_review.sh` script, to support Windows environments.
