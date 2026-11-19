# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.5/jobman_1.10.5_darwin_amd64.tar.gz"
      sha256 "697147e181a0b1f91c5a0f36af090c012188bbaa869026eb5037b002635480bc"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.10.5/jobman_1.10.5_darwin_arm64.tar.gz"
      sha256 "f7a0c51853dec8652911c6e8dc4ca9a69cb548ace2ba0235f3084ee5d809b72b"
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
    assert_match "jobman 1.10.5", shell_output("#{bin}/jobman --version")
  end
end
