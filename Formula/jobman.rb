class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.2.0/jobman_1.2.0_darwin_amd64.tar.gz"
      sha256 "17dd6b09487c157253f5879b0cf3115fffe7370146df1728904df9775cbcbc0f"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.2.0/jobman_1.2.0_darwin_arm64.tar.gz"
      sha256 "d3aa537976677ed185e014d4a53d7e59f03f9a24c187b74d25a3e575c3e32d60"
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
