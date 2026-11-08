# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.9.1/jobman_1.9.1_darwin_amd64.tar.gz"
      sha256 "b5a834a47472afd9b8121edda75c5b98baec8c20e04b14e1306fa2ad5901ca75"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.9.1/jobman_1.9.1_darwin_arm64.tar.gz"
      sha256 "8f5ded13502ed070bef340e88258989b7faac35be6edc339cde3035f17a57aad"
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
    assert_match "jobman 1.9.1", shell_output("#{bin}/jobman --version")
  end
end
