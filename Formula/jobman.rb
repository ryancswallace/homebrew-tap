# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.7.0/jobman_1.7.0_darwin_amd64.tar.gz"
      sha256 "cfd0b9173cc87dcfcf27bc42f83cde98540e132d5ab8fb1eb5b561748b32946c"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.7.0/jobman_1.7.0_darwin_arm64.tar.gz"
      sha256 "94f857f038e507196e4d5619140cc8e44140d3be82858b53103bf001956f4087"
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
    assert_match "jobman 1.7.0", shell_output("#{bin}/jobman --version")
  end
end
