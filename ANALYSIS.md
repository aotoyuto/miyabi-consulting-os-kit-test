# Project Analysis: Miyabi-style Consulting OS Kit

## 1. Project Overview

This project is a template for managing consulting projects using GitHub as the central platform for task management, version control, and decision making. It is designed to be used with an AI assistant like Claude or Gemini to automate and streamline the workflow.

The core principles of this system are:
*   **GitHub as the Single Source of Truth (SSOT):** All project-related information, including tasks, code, decisions, and documentation, is stored and managed in a GitHub repository.
*   **AI-Assisted Workflow:** The system is designed to be used with an AI assistant to automate tasks like code review, branch creation, and pull request generation.
*   **Structured Workflow:** The project provides a well-defined workflow for managing tasks from intake to completion, using GitHub Issues and Pull Requests.
*   **Safety and Robustness:** The system includes guardrails and checks to prevent dangerous operations and ensure code quality.

## 2. Workflow

The project's workflow is centered around GitHub Issues and Pull Requests:
1.  **Task Intake:** New tasks are created as GitHub Issues using the `01_intake.md` template.
2.  **Branching:** The `scripts/miyabi-start.sh` script is used to create a new branch for each task, named after the corresponding issue.
3.  **Development:** Work is done on the task branch.
4.  **Pull Request:** The `scripts/miyabi-finish.sh` script is used to create a Pull Request for the completed work.
5.  **AI Review:** An automated AI review is triggered on each Pull Request using a GitHub Actions workflow (`.github/workflows/ai_review.yml`).
6.  **Decision Making:** Important decisions are discussed in "Decision" issues and documented as Architectural Decision Records (ADRs) in the `docs/decisions` directory.

## 3. Key Files and Scripts

*   `README.md`, `CLAUDE.md`, `GEMINI.md`: These files provide documentation and instructions for using the system.
*   `scripts/miyabi-start.sh`: Creates a new task branch.
*   `scripts/miyabi-finish.sh`: Creates a new Pull Request.
*   `scripts/ai/pr_review.sh`: Performs an AI-powered code review.
*   `.github/workflows/ai_review.yml`: GitHub Actions workflow for automated AI reviews.
*   `.claude/settings.json`: Configures hooks for the AI assistant.
*   `Makefile`: Provides shortcuts for common tasks like running AI reviews and bootstrapping labels.
*   `scripts/github/bootstrap_labels.sh`: Creates a standardized set of labels for managing GitHub Issues.

## 4. Analysis and Improvements

During the analysis of this project, the following improvements were made:

*   **Improved Script Robustness:** The `scripts/miyabi-start.sh` script was modified to ensure that it will exit if the `git pull --rebase` command fails. This prevents potential conflicts from being ignored.
*   **Comprehensive Documentation:** The `GEMINI.md` file was created and updated to provide a comprehensive overview of the project, including a description of the `Makefile` and the GitHub labels.

## 5. Conclusion

This project provides a well-structured and robust system for managing consulting projects. By leveraging GitHub and AI, it has the potential to significantly improve efficiency, consistency, and quality. The provided scripts and workflows are well-designed and the use of guardrails and checks enhances the safety of the system.
