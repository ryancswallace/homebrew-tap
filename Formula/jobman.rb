# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.3/jobman_1.10.3_darwin_amd64.tar.gz"
      sha256 "e60c9595f8046001ab9c90ff13d3be9fe9bc258bb954c793ed7950647d9d718d"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.3/jobman_1.10.3_darwin_arm64.tar.gz"
      sha256 "996deaee4f521904093957fb5e06997c83526c78e3268ed15e2102a40c55810f"
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
    assert_match "jobman 1.10.3", shell_output("#{bin}/jobman --version")
  end
end
