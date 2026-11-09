# typed: strict
# frozen_string_literal: true

# Release checksum manifest SHA-256: 7d1c9af7955f7f6dab40446b03b1209bf0465f3a3ddd8660942b6456d1eedf0f
class JobmanControl < Formula
  desc "Shared PostgreSQL-backed control plane for Jobman"
  homepage "https://github.com/ryancswallace/jobman-control"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.4.1/jobman-control_0.4.1_darwin_amd64.tar.gz"
      sha256 "7a81f139d1e91af4d23c04398cdd52550782901ff6944f5aada3c60a807a727c"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.4.1/jobman-control_0.4.1_darwin_arm64.tar.gz"
      sha256 "c0c8fe3370c6a67aa0210e7c2b7c301c9ecc47c863be8917575613ca79f4e05e"
    end
  end

  def install
    bin.install "jobman-control"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-control 0.4.1", shell_output("#{bin}/jobman-control --version")
  end
end
