# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.2/jobman_1.10.2_darwin_amd64.tar.gz"
      sha256 "3121d0332e42f450b12857f8738e8daa86a6852d655a217c967b18f6c1f9234a"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.2/jobman_1.10.2_darwin_arm64.tar.gz"
      sha256 "c8ec6f94e078c617a15894f416738b883c33ad6b82bb107dafbe220ed3fe5df1"
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
    assert_match "jobman 1.10.2", shell_output("#{bin}/jobman --version")
  end
end
