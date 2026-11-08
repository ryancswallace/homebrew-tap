# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.0/jobman_1.10.0_darwin_amd64.tar.gz"
      sha256 "04933546c1035977f6233588c0b32b65f29d4f2d6633eb8273c67220dea84a6f"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.0/jobman_1.10.0_darwin_arm64.tar.gz"
      sha256 "ccbb46122f1645aeed19e6628366b110adf79f6c2234ac74d44f22f5807f6e16"
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
    assert_match "jobman 1.10.0", shell_output("#{bin}/jobman --version")
  end
end
