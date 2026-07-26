# Jobman Homebrew tap

This is the official Homebrew tap for
[Jobman](https://github.com/ryancswallace/jobman), a daemonless command-line
job manager.

## Install

Install the formula directly:

```sh
brew install ryancswallace/tap/jobman
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

The Jobman release workflow generates `Formula/jobman.rb` from the verified
release archives and updates this tap only after the corresponding GitHub
release is public. Do not edit the generated formula manually. Report packaging
problems in the [Jobman issue
tracker](https://github.com/ryancswallace/jobman/issues).
