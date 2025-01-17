# Style Guide

This document outlines the style guide for **{{REPO_OWNER}}/{{REPO_NAME}}**, including commit message formatting,
coding conventions, and file structure guidelines. Adhering to these guidelines ensures consistency
and readability across the project.

## File and Directory Structure

This section outlines the recommended structure for repository.

### Root-Level Files and Directories

| **File/Directory**        | **Purpose**                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------- |
| `.devcontainer/`          | Configuration for development containers (e.g., Dockerfiles and `devcontainer.json`). |
| `.github/`                | GitHub-specific configuration files, such as issue and pull request templates.        |
| `.husky/`                 | Git hooks managed by Husky for tasks like linting, testing, etc.                      |
| `docs/`                   | Project documentation, including guides and FAQs.                                     |
| `scripts/`                | Custom scripts for automation (e.g., deployment, setup, or CI tasks).                 |
| `src/`                    | Source code for the project.                                                          |
| `tests/`                  | Unit and integration test files.                                                      |
| `.env.example`            | Example environment variables for local development.                                  |
| `.gitignore`              | Specifies intentionally untracked files to ignore in the repository.                  |
| `.pre-commit-config.yaml` | Configuration for pre-commit hooks.                                                   |
| `CHANGELOG.md`            | Logs significant changes across versions.                                             |
| `CODE_OF_CONDUCT.md`      | Community standards for behavior.                                                     |
| `CONTRIBUTING.md`         | Guidelines for contributing to the project.                                           |
| `Dockerfile`              | Defines the Docker container setup, if applicable.                                    |
| `LICENSE`                 | Licensing information for the repository.                                             |
| `Makefile`                | Defines common build tasks for the project.                                           |
| `package.json`            | For JavaScript/Node.js projects, includes metadata and dependencies.                  |
| `pyproject.toml`          | Configuration for Python projects, including dependencies.                            |
| `README.md`               | Overview of the project, including setup and usage instructions.                      |
| `SECURITY.md`             | Instructions for reporting security vulnerabilities.                                  |

#### **Development Tools (`.devcontainer/`)**

| **Subdirectory/File** | **Purpose**                                                               |
| --------------------- | ------------------------------------------------------------------------- |
| `.dockerignore`       | Specifies files and directories to exclude from the Docker build context. |
| `devcontainer.json`   | Configuration for devcontainers, defining the development environment.    |
| `Dockerfile`          | Container image definition for development.                               |

#### **GitHub-Specific Configuration (`.github/`)**

| **Subdirectory/File**      | **Purpose**                                                                  |
| -------------------------- | ---------------------------------------------------------------------------- |
| `ISSUE_TEMPLATE/`          | Templates for bug reports, feature requests, or general questions.           |
| `PULL_REQUEST_TEMPLATE/`   | Directory containing multiple templates for specific types of pull requests. |
| `workflows/`               | GitHub Actions workflow definitions for CI/CD pipelines.                     |
| `dependabot.yml`           | Configuration file for Dependabot to automate dependency updates.            |
| `FUNDING.yml`              | Links to funding or donation platforms like GitHub Sponsors or PayPal.       |
| `PULL_REQUEST_TEMPLATE.md` | Default template for pull requests.                                          |

#### **Git Hooks (`.husky/`)**

| **File/Hook**       | **Purpose**                                                               |
| ------------------- | ------------------------------------------------------------------------- |
| `.husky/pre-commit` | Runs pre-commit tasks (e.g., linting, testing) before committing changes. |
| `.husky/pre-push`   | Executes tasks like running tests before pushing code.                    |

#### **Scripts (`scripts/`)**

| **File/Script** | **Purpose**                                            |
| --------------- | ------------------------------------------------------ |
| `setup.sh`      | Environment setup or project initialization script.    |
| `build.sh`      | Script to build the project locally or for production. |
| `test.sh`       | Wrapper for running tests and linting.                 |

#### **Source Code (`src/`)**

| **Subdirectory/File**   | **Purpose**                                  |
| ----------------------- | -------------------------------------------- |
| `main.py` or `index.js` | The main entry point of the application.     |
| `<module_name>/`        | Modularized code for specific functionality. |
| `utils/`                | Helper functions or reusable utilities.      |
| `config/`               | Configuration files and constants.           |
| `models/`               | Data models or schemas.                      |
| `services/`             | Business logic or service-layer code.        |

#### **Tests (`tests/`)**

| **Subdirectory/File** | **Purpose**                |
| --------------------- | -------------------------- |
| `test_<module>.py`    | Unit tests for `<module>`. |
| `integration/`        | Integration tests.         |
| `fixtures/`           | Test data or mock files.   |

## Commit Messages

This section provides a comprehensive yet concise guide to writing clear, consistent,
and meaningful commit messages for this repository. It is based on the [Conventional Commits][conventional-commits]
standard, with additional rules and custom tags tailored to the needs of this project.

### Commit Message Structure

A well-structured commit message comprises three parts:

```plaintext
<type>(<scope>): <description>

<detailed description>

[FILES ADDED]
 - <list of added files>

[FILES MODIFIED]
 - <list of modified files>

[FILES REMOVED]
 - <list of removed files>

[DEPENDENCIES ADDED]
 - <list of new dependencies>

[DEPENDENCIES UPDATED]
 - <list of updated dependencies>

[DEPENDENCIES REMOVED]
 - <list of removed dependencies>

[FEATURES/CHANGES]
 - <list of new features, updates, or changes>

[TECHNIQUES]
 - <optional details about methods, tools, or approaches used>

[BREAKING CHANGE]
 - <description of breaking change and required user actions>

[PURPOSE]
 - <reason for the change or issue addressed>

[IMPACT]
 - <impact on the project, users, or performance>

[FIXES/CLOSES/RESOLVES]
 - #<list of issue numbers related to this commit>

[REFERENCES]
 - <links to documentation, code reviews, or related resources>
```

### Part-by-Part Breakdown

#### **1. Header**

- **Format:** `<type>(<scope>): <description>`
- **Purpose:** The header is a concise summary of the change.
- **Components:**
  - **`<type>`**: Describes the type of change. Common values include:
    - `feat`: Adding a new feature.
    - `fix`: Fixing a bug.
    - `docs`: Updating documentation.
    - `style`: Code formatting or styling changes (no functional impact).
    - `refactor`: Code restructuring without changing functionality.
    - `deps`: Changes to project dependencies (add, update, or remove).
    - `perf`: Improving performance.
    - `security`: Addressing security vulnerabilities or enhancing security features.
    - `test`: Adding or updating tests.
    - `chore`: Routine tasks, like updating dependencies or build configs.
  - **`<scope>`**: The module or feature affected (optional but recommended).
  - **`<description>`**: A short, imperative summary of what the commit does (e.g., "add logging" not "added logging").

#### **2. Detailed Description (Optional)**

- **Purpose:** To provide additional context or explanation for the change.
- Use full sentences or bullet points to explain:
  - What the change does.
  - Why the change was made.
  - How it was implemented.

#### **3. Additional Sections**

Include any of these sections as needed for clarity.

- **Files Affected:**

  - `[FILES ADDED]`: List files added.
  - `[FILES MODIFIED]`: List files updated.
  - `[FILES REMOVED]`: List files deleted.

- **Dependencies:**

  - `[DEPENDENCIES ADDED]`: Newly added libraries.
  - `[DEPENDENCIES UPDATED]`: Updated libraries.
  - `[DEPENDENCIES REMOVED]`: Removed libraries.

- **Features/Changes:**

  - `[FEATURES/CHANGES]`: Key features, updates, or changes made in the commit.

- **Techniques (Optional):**

  - `[TECHNIQUES]`: Methods, tools, or approaches used in the implementation.

- **Breaking Changes:**

  - `[BREAKING CHANGE]`: Description of any changes that require users to adapt.
    - _Always clearly indicate breaking changes to prevent unexpected issues for collaborators or users._
    - Example: "Replaced legacy authentication with OAuth2. Update API keys accordingly."

- **Purpose:**

  - `[PURPOSE]`: Why this commit was necessary.

- **Impact:**

  - `[IMPACT]`: The effect on the project, users, or performance.
  - _Describing changes by user experience or business value helps non-technical stakeholders understand the commit._

- **Issue References:**

  - `[FIXES/CLOSES/RESOLVES]`: linking related issues or tasks (e.g., `#123`).

- **References (Optional):**
  - `[REFERENCES]`: Links to documentation, code reviews, or designs related to the change.

### Example Commit Message

```plaintext
feat(auth): add OAuth2 login support

Added OAuth2 authentication to allow users to log in with Google and GitHub.
Improved error handling in login flows.

[FILES ADDED]
 - src/auth/oauth2.js
 - src/auth/oauth2.test.js

[FILES MODIFIED]
 - src/auth/index.js

[DEPENDENCIES ADDED]
 - google-auth-library
 - @octokit/auth

[FEATURES/CHANGES]
 - Implemented Google and GitHub login.
 - Enhanced error-handling for authentication.

[BREAKING CHANGE]
 - Replaced legacy login methods. Users must update API keys.

[PURPOSE]
 - Improve user authentication and security.

[IMPACT]
 - Streamlines login experience and enhances security.

[FIXES]
 - #123, #456

[REFERENCES]
 - OAuth2 Documentation: https://example.com/oauth2
```

### Best Practices

1. **Be Concise and Specific:** Focus on what the commit does and why.
2. **Use Imperative Mood:** Write as if giving commands (e.g., "add feature" not "added feature").
3. **Separate Logical Changes:** Each commit should focus on one specific change.
4. **Follow the Template:** Use consistent formatting to improve readability and collaboration.

## Purpose of This Guide

This style guide ensures consistency, enhances clarity, and aligns with the project's goals.
By following these conventions, we make the repository easier to navigate, extend, and maintain.

[conventional-commits]: https://www.conventionalcommits.org
