# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.8.0/jobman_1.8.0_darwin_amd64.tar.gz"
      sha256 "05721f4bd5254eda154db967002ad60f9125daaee37baae99dc5a6ef1c4b18b2"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.8.0/jobman_1.8.0_darwin_arm64.tar.gz"
      sha256 "d2e4e39cbc093bd3e9acc01ccce383dee5538669d06db24b58847dfb8b8b2744"
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
    assert_match "jobman 1.8.0", shell_output("#{bin}/jobman --version")
  end
end
