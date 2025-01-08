# Common Docs

This repository contains common documentation files that can be reused across multiple projects
to maintain consistency and streamline the setup process.

## Current Contents

- `.github/PULL_REQUEST_TEMPLATE.md`: Default pull request template for general contributions.
- `.github/PULL_REQUEST_TEMPLATE/*`: Templates for specific pull requests, such as `bugfix`, `docs`, and `feature`.
- `.github/ISSUE_TEMPLATE/*`: Templates for reporting bugs, requesting features, and asking questions.
- `.github/FUNDING.yml`: Information on funding options and sponsorship links.
- `CODE_OF_CONDUCT.md`: Standards for behavior within the community.
- `LICENSE.template`: MIT license template with placeholders, used across most repositories to clarify usage rights.
- `SECURITY.md`: Guidelines for securely reporting vulnerabilities and related contact details.

## Usage

1. **Run the Deployment Script**:
   Use the `deploy.sh` script to download the latest release of the documentation and apply your custom configurations.

   ```bash
   bash deploy.sh --target <target_directory> [--config <path_to_config.yml>]
   ```

   - `--target <target_directory>`: Specify the directory where the documentation will be deployed.
   - `--config <path_to_config.yml>` (optional): Path to the configuration file (`config.yml`). Defaults to `config.yml` in the current directory.

2. **Automated Placeholder Replacement**:
   The script will replace placeholders (e.g., `{{GITHUB_USERNAME}}`) in the downloaded files based on the values in your configuration file.

3. **Preserves Folder Structure**:
   The folder structure from the release will be maintained in the target directory.

4. **License Handling**:
   - If a `LICENSE` file does not exist in the target directory, the script renames `LICENSE.template` to `LICENSE` automatically.

5. **Manual Usage (Optional)**:
   Alternatively, you can manually clone the repository and copy specific files:

   ```bash
   git clone https://github.com/Jekwwer/common-docs.git
   ```

   Copy the desired documentation file(s) into your project and customize them as needed.

---

### Example

To deploy the documentation to a new repository:

```bash
bash deploy.sh --target ../my-new-repo
```

This will:
- Download the latest release.
- Replace placeholders with values from `config.yml`.
- Deploy the documentation to the `../my-new-repo` directory, preserving the folder structure.


### Potential Future Documentation

This table serves as a reference for adding new documents to meet future project requirements as they arise.

| **Document Name**      | **Purpose**                                                                             |
| ---------------------- | --------------------------------------------------------------------------------------- |
| **.env.example**       | Example environment variables for easy local setup.                                     |
| **ACKNOWLEDGMENTS.md** | Recognizes contributions from libraries, frameworks, or individuals.                    |
| **ARCHITECTURE.md**    | Offers an overview of the project’s structure and design decisions.                     |
| **BUILD.md**           | Instructions for building the project, including dependencies and troubleshooting.      |
| **CHANGELOG.md**       | Logs versioned updates and significant changes for transparency.                        |
| **CONFIG.md**          | Documents configuration options, environment variables, and setup instructions.         |
| **CONTRIBUTING.md**    | Guidelines for contributing to the project: coding standards, PRs, and issue reports.   |
| **CONVENTIONS.md**     | Describes naming patterns, coding standards, or folder structures for consistency.      |
| **DEPENDENCIES.md**    | Lists key dependencies and their versions for compatibility insights.                   |
| **DOCS/** Directory    | A dedicated folder for detailed guides, API references, or architecture diagrams.       |
| **FAQ.md**             | Answers frequently asked questions to save time and clarify common concerns.            |
| **GLOSSARY.md**        | Defines domain-specific terms and abbreviations for clarity.                            |
| **GOVERNANCE.md**      | Outlines roles, responsibilities, and decision-making processes for maintainers.        |
| **INSTALL.md**         | Detailed installation instructions for projects with complex setup requirements.        |
| **MIGRATION_GUIDE.md** | Helps users upgrade between major versions by detailing changes and migration steps.    |
| **ROADMAP.md**         | Provides insights into the project’s future direction and priorities.                   |
| **RELEASE.md**         | Instructions for managing and packaging project releases.                               |
| **STYLEGUIDE.md**      | Defines coding styles and best practices for contributors.                              |
| **SUPPORT.md**         | Provides resources for getting help, including forums, FAQs, or troubleshooting guides. |
| **TESTING.md**         | Explains testing frameworks, setup, and commands for running tests.                     |
| **TODO.md**            | Lists future plans, pending features, or unresolved issues for transparency.            |
| **USAGE.md**           | Advanced usage examples, command-line options, or API details.                          |

## Contributing

Although this repository is primarily maintained for personal use, suggestions or improvements are welcome.
Please feel free to open an issue or pull request if you have ideas to enhance the repository.

## License

This repository is licensed under MIT License. See the [LICENSE][LICENSE] file for details.

---

### Notes

This repository was created using my [Markdown Template][markdown-template],
currently at version [v1.0.2][markdown-template-v1.0.2].
The template serves as a development foundation for working on markdown documentation effectively.

[markdown-template]: https://github.com/Jekwwer/markdown-template
[markdown-template-v1.0.2]: https://github.com/Jekwwer/markdown-template/tree/v1.0.2
[LICENSE]: LICENSE
