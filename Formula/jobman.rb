# typed: strict
# frozen_string_literal: true

# Installs Jobman from its verified release archive.
class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.6.0/jobman_1.6.0_darwin_amd64.tar.gz"
      sha256 "04e34f3cabda6ffa136c9b54859e225385fa5aa77cbfb768ece13a86172c41c8"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.6.0/jobman_1.6.0_darwin_arm64.tar.gz"
      sha256 "fd6d540ff3241dde629d6fe2e518d7fce63146b645b248c039448a2796341a99"
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
    assert_match "jobman 1.6.0", shell_output("#{bin}/jobman --version")
  end
end
