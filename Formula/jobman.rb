class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.4.0/jobman_1.4.0_darwin_amd64.tar.gz"
      sha256 "74663a85298f2f71df1d558c975d74855936ee59da41e721d6db870f187b19c0"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.4.0/jobman_1.4.0_darwin_arm64.tar.gz"
      sha256 "b48fc243fbc00c0fdbfbfcdc0076368eb765003c89d3e929e4a5f1947cb3e879"
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
