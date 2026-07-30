class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  version "1.1.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.1.5/jobman_1.1.5_darwin_amd64.tar.gz"
      sha256 "0909ca9afdacfd9e57bc1b19f0ad017cc426561007f2bfd35fd76a1460e0c7c8"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.1.5/jobman_1.1.5_darwin_arm64.tar.gz"
      sha256 "57992e04d3786aa0671b4433608760128c17608a1c986a6ea419b3157a7c7de8"
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
    assert_match version.to_s, shell_output("#{bin}/jobman --version")
  end
end
