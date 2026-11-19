# typed: strict
# frozen_string_literal: true

# Release checksum manifest SHA-256: af0bf4602954c2fac1b8aa05b52e5dde9d44ea8d0111d50505f988cb6c112e3b
class JobmanControl < Formula
  desc "Shared PostgreSQL-backed control plane for Jobman"
  homepage "https://github.com/ryancswallace/jobman-control"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.4.3/jobman-control_0.4.3_darwin_amd64.tar.gz"
      sha256 "3260975bd7b55ae991a15926e61df174fcb08cc42548d3150a6981f1f2483190"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.4.3/jobman-control_0.4.3_darwin_arm64.tar.gz"
      sha256 "f844ed437a27f972817ba166dbe33f359a189994f8250695d1622539ef93ed2d"
    end
  end

  def install
    bin.install "jobman-control"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-control 0.4.3", shell_output("#{bin}/jobman-control --version")
  end
end
