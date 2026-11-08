# typed: strict
# frozen_string_literal: true

class JobmanControl < Formula
  desc "Shared PostgreSQL-backed control plane for Jobman"
  homepage "https://github.com/ryancswallace/jobman-control"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.3.1/jobman-control_0.3.1_darwin_amd64.tar.gz"
      sha256 "398a0fc7f2e527d7af19cd6a784dcbd599e3aff909786af698df51dca6839b49"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.3.1/jobman-control_0.3.1_darwin_arm64.tar.gz"
      sha256 "83db7de9552b1f109ee1044f40491743071a2a05b862e57de4c2166c607a22a8"
    end
  end

  def install
    bin.install "jobman-control"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-control 0.3.1", shell_output("#{bin}/jobman-control --version")
  end
end
