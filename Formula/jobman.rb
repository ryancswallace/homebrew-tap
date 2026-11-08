# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.1/jobman_1.10.1_darwin_amd64.tar.gz"
      sha256 "c686e2ab8ce1d74f142372c6cf5973cb301a2ae64d747e0299f2f1ed09c653cf"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.1/jobman_1.10.1_darwin_arm64.tar.gz"
      sha256 "a8526189d65640b4498a083caf50cbc337c1674650f186fe134ce27d61a0b7da"
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
    assert_match "jobman 1.10.1", shell_output("#{bin}/jobman --version")
  end
end
