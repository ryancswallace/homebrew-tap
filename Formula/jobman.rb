# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.5.0/jobman_1.5.0_darwin_amd64.tar.gz"
      sha256 "47ef285d9ac83e74327600768c687eee9de16603e29adfc7da9e8bc66c23a32c"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.5.0/jobman_1.5.0_darwin_arm64.tar.gz"
      sha256 "f667c1f7077db9aa76fdb437b23c7216f769957295eaa5f4e8dc7f8084d70216"
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
    assert_match "jobman 1.5.0", shell_output("#{bin}/jobman --version")
  end
end
