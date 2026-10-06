# typed: strict
# frozen_string_literal: true

class JobmanControl < Formula
  desc "Shared PostgreSQL-backed control plane for Jobman"
  homepage "https://github.com/ryancswallace/jobman-control"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.2.0/jobman-control_0.2.0_darwin_amd64.tar.gz"
      sha256 "b44905d5754ff89eedb578e91afeeaf5a99ff2a7dbae32d6fddfb007e112ead3"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.2.0/jobman-control_0.2.0_darwin_arm64.tar.gz"
      sha256 "d220c257f3f0c7dc619b39123f2d2d9bd9a56af1939255ff68de3c7f58e55134"
    end
  end

  def install
    bin.install "jobman-control"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-control 0.2.0", shell_output("#{bin}/jobman-control --version")
  end
end
