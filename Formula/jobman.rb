# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.4/jobman_1.10.4_darwin_amd64.tar.gz"
      sha256 "9138ae4a6dc8b82c6bafa65cf46226f59b51bb311c22d191c1e5ceb7ce4aa54b"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.4/jobman_1.10.4_darwin_arm64.tar.gz"
      sha256 "9ee9d10849db239e1f725378dd772afac7ee2cbf7a96a587c079fff931b3754a"
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
    assert_match "jobman 1.10.4", shell_output("#{bin}/jobman --version")
  end
end
