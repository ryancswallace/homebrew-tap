class Jobman < Formula
  desc "Daemonless command-line job manager with retries, timeouts, and logs"
  homepage "https://github.com/ryancswallace/jobman"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.1.0/jobman_1.1.0_darwin_amd64.tar.gz"
      sha256 "e9a6a8306018bc51bdc5cf61722c4709ae80633baa03211516163f601cb3367d"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman/releases/download/v1.1.0/jobman_1.1.0_darwin_arm64.tar.gz"
      sha256 "e8a2849e2580545e665c5ae6a0431e64c28ae0ade954f966e042d3f69c106507"
    end
  end

  def install
    bin.install "jobman"
    bash_completion.install "docs/completions/bash/jobman"
    zsh_completion.install "docs/completions/zsh/_jobman"
    man1.install Dir["docs/manpage/jobman*.1"]
    etc.install "etc/jobman/jobman.yml" => "jobman/jobman.yml"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jobman --version")
    system bin/"jobman", "config", "validate", etc/"jobman/jobman.yml"
  end
end
