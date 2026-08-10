# Jobman Homebrew tap

This is the official Homebrew tap for
[Jobman](https://github.com/ryancswallace/jobman), a daemonless command-line
job manager, and its optional
[Jobman Diagnose](https://github.com/ryancswallace/jobman-diagnose) companion.

## Install

Install the formula directly:

```sh
brew install ryancswallace/tap/jobman
brew install ryancswallace/tap/jobman-diagnose
```

The formula installs the `jobman` executable, man pages, sample configuration,
and Bash and Zsh completions. Start a new shell after installation so it
discovers the completions.

Upgrade or remove Jobman with:

```sh
brew upgrade ryancswallace/tap/jobman
brew uninstall jobman
```

Jobman's macOS executable is not currently Apple Developer ID signed or
notarized. Review and verify the release before accepting any Gatekeeper
exception.

## Maintenance

The projects' release workflows generate their formulas only from verified
public release archives. Updates arrive as pull requests; protected `main`
requires strict online audit, installation, and formula tests for both formulas
on Intel and Apple Silicon runners before auto-merge. Do not edit generated
formulas manually. Report packaging problems in the relevant project's issue
tracker.
