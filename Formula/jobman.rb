class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  version "1.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.1.3/jobman_1.1.3_darwin_amd64.tar.gz"
      sha256 "ffd3d029f054ffe1281aafb041159d69c16ca6285b6dfb33c2c829bcf821412e"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.1.3/jobman_1.1.3_darwin_arm64.tar.gz"
      sha256 "7412777fd4aa64ebb7bfdf1acd0c5b9a376a36e91a2437be7e49d2651876ae06"
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
