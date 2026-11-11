# Contributing to PokemonHuntScripts

Welcome! We're glad you're interested in contributing to PokemonHuntScripts. This document outlines how to contribute effectively.

## Code of Conduct
Please follow the [OpenCode Code of Conduct](https://github.com/opencode/opencode/blob/main/CODE_OF_CONDUCT.md).

## How to Contribute
### Report Bugs
- Check existing issues to avoid duplication.
- If you find a bug, [open an issue](https://github.com/Phosky71/PokemonHuntScripts/issues/new) with:
  - Clear description of the problem.
  - Steps to reproduce.
  - Expected vs. actual behavior.
  - Environment details (emulator, ROM version, script version).

### Suggest Enhancements
- Open an issue with a clear description of the proposed change.
- Include use cases and why it's beneficial.

### Fix Bugs / Implement Features
1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/your-feature`).
3. Make your changes.
4. Run tests (if available).
5. Ensure code follows existing style.
6. Commit with descriptive messages.
7. Push to your branch.
8. Open a Pull Request.

## Pull Request Process
- All PRs require a **code gate**: automated tests + audit.
- PR reviewers will check:
  - Code correctness.
  - Documentation updates.
  - License compliance.
  - No regressions.
- Resolve feedback before merge.

## Style Guide
- Follow the existing code style (Lua, Python, Markdown).
- Use meaningful variable names.
- Add comments for complex logic.
- Keep commits atomic and descriptive.

## Documentation
- Update `README.md` for user-facing changes.
- Update per-tool `.md` files for script changes.
- Keep `CREDITS.md` up-to-date for new integrations.
- Update `PROJECT_AUDIT.md` for audit-related changes.

## Testing
- Run `npm test` (if applicable) or use the provided test scripts.
- Verify scripts work with VBA-M rr 23.6 for Gen1.
- Document any limitations in the PR description.

## Questions
- For questions, [open an issue](https://github.com/Phosky71/PokemonHuntScripts/issues/new).
- For urgent matters, contact the maintainer team via GitHub Discussions.

Thank you for contributing!