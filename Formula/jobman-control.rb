# typed: strict
# frozen_string_literal: true

class JobmanControl < Formula
  desc "Shared PostgreSQL-backed control plane for Jobman"
  homepage "https://github.com/ryancswallace/jobman-control"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.3.0/jobman-control_0.3.0_darwin_amd64.tar.gz"
      sha256 "19ddfd3339cd691c44f059970d3539307d02ec5f616225631d1565ccaffe0984"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.3.0/jobman-control_0.3.0_darwin_arm64.tar.gz"
      sha256 "7906441c73e06fb87a8a05cbb2f6c1c7791c34a8a2fb24910a65179784774787"
    end
  end

  def install
    bin.install "jobman-control"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-control 0.3.0", shell_output("#{bin}/jobman-control --version")
  end
end
