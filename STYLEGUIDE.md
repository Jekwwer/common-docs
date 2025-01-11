# Style Guide

This document outlines the style guide for **{{REPO_OWNER}}/{{REPO_NAME}}**, including commit message formatting,
coding conventions, and file structure guidelines. Adhering to these guidelines ensures consistency
and readability across the project.

---

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

---

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

---

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

---

### Best Practices

1. **Be Concise and Specific:** Focus on what the commit does and why.
2. **Use Imperative Mood:** Write as if giving commands (e.g., "add feature" not "added feature").
3. **Separate Logical Changes:** Each commit should focus on one specific change.
4. **Follow the Template:** Use consistent formatting to improve readability and collaboration.

[conventional-commits]: https://www.conventionalcommits.org
