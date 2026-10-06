# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.9.0/jobman_1.9.0_darwin_amd64.tar.gz"
      sha256 "b56af88e7606c4fde7fe17388ffadf9dfa42ed4fe65f6126ad1507f7f62ea878"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.9.0/jobman_1.9.0_darwin_arm64.tar.gz"
      sha256 "97e036f8a79aba02228dbe658ad86a460d338cf4b7078f43548fed61fd7f0913"
    end
  end

  def install
    bin.install "jobman"
    bash_completion.install "docs/completions/bash/jobman"
    zsh_completion.install "docs/completions/zsh/_jobman"
    man1.install Dir["docs/manpage/jobman*.1"]
    (etc/"jobman").install "etc/jobman/jobman.yml"
  end

  test do
    assert_match "jobman 1.9.0", shell_output("#{bin}/jobman --version")
  end
end
