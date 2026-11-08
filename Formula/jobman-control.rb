# typed: strict
# frozen_string_literal: true

class JobmanControl < Formula
  desc "Shared PostgreSQL-backed control plane for Jobman"
  homepage "https://github.com/ryancswallace/jobman-control"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.2.1/jobman-control_0.2.1_darwin_amd64.tar.gz"
      sha256 "41cce25043b1963469ad53e2ecda0779b69c5321d9f996be47ca040e3128271b"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.2.1/jobman-control_0.2.1_darwin_arm64.tar.gz"
      sha256 "fba06e15ecc6eb3bf04336c394b4e168920d2738906c1a7b356b1611d5a44a8c"
    end
  end

  def install
    bin.install "jobman-control"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-control 0.2.1", shell_output("#{bin}/jobman-control --version")
  end
end
