class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  version "1.1.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.1.4/jobman_1.1.4_darwin_amd64.tar.gz"
      sha256 "23659da74de32c44cd9016bb0789ff762aa276a23d4ced7c227956c10cf9de27"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.1.4/jobman_1.1.4_darwin_arm64.tar.gz"
      sha256 "3102943d332a8c3822313cc4e6d978239bb536849fc31681927af97f522b1d35"
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
