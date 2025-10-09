# Commit Message Guidelines

Using structured commit messages helps automate changelog generation, improve code review clarity, and maintain a readable project history.

This project follows the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification for consistent and meaningful commit messages.

## Recommended Structure

``` markdown
<type>(<scope>): <subject>

[optional body]

[optional footer]
```

## Explanation

### Header

- **type**: A prefix that describes the nature of the change. Common types include:
  - **feat**: A new feature.
  - **fix**: A bug fix.
  - **docs**: Documentation-only changes.
  - **style**: Changes that do not affect the meaning of the code (whitespace, formatting, etc).
  - **refactor**: A code change that neither fixes a bug nor adds a feature.
  - **perf**: A code change that improves performance.
  - **test**: Adding missing tests or correcting existing ones.
  - **chore**: Changes to the build process or auxiliary tools.

- **(\<scope\>)** **Optional:** The part of the codebase affected by the changes (e.g., `api`, `auth`, `ui`, `db`, `config`).

- **\<subject\>:** A brief, imperative-mood description of the change.
  - Keep it under 50 characters.
  - Use the present tense (e.g., "add", "fix", "change").
  - Don't capitalize the first letter.
  - Don't end with a period.

### Body (Optional)

- Separated from the header by a blank line.
- Explains the "what" and "why" of the change, not the "how".
- Wrap lines at 72 characters for readability.

### Footer (Optional)

- Separated from the body by a blank line.
- This is where you link to the GitHub issue.
- Use keywords to automatically close the issue when the commit is merged into the main branch.

## Linking to a GitHub Issue

To link a commit to an issue, you reference the issue number (e.g., `#123`) in the commit message. To automatically close the issue upon merging, use one of the following keywords:

- `close`
- `closes`
- `closed`
- `fix`
- `fixes`
- `fixed`
- `resolve`
- `resolves`
- `resolved`

The reference should be placed in the commit message's footer.

## Breaking Changes

If your change introduces a breaking API or behavior, include a `BREAKING CHANGE:` line in the footer.

Example:

``` markdown
feat(api): update user endpoint to use pagination

BREAKING CHANGE: `/api/users` now requires `page` and `limit` parameters.
```

### Examples

Here are some examples of well-structured commit messages:

``` markdown
fix(auth): enable login button on valid input

The login button was not being re-enabled after a failed
login attempt, even when the user corrected their credentials.
This change ensures the button's state is correctly updated
based on the form's validity.

Fixes: #42
```

``` markdown
feat(export): add CSV export functionality to reports

- Implements a new "Export to CSV" button on the reports page.
- Utilizes the `papaparse` library for efficient CSV generation.
- Adds a new API endpoint `/api/reports/export` to handle the request.

Closes: #58
```

``` markdown
docs(readme): correct spelling in installation instructions

Refs: #73
```

---

Following these guidelines keeps our commit history clean, consistent, and easy to understand.  
Thank you for contributing!
