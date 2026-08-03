class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.3.0/jobman_1.3.0_darwin_amd64.tar.gz"
      sha256 "fcb8a337ea8a430621456560b7b2682b113bff990b4b9ff542da5ff86c4284a0"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.3.0/jobman_1.3.0_darwin_arm64.tar.gz"
      sha256 "ccd81131b850557da8e8da037dc20bc906f0055641231f7d37763477aba81572"
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
