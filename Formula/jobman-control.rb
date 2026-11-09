# typed: strict
# frozen_string_literal: true

# Release checksum manifest SHA-256: fb3c0f5dee3834be79b7c89417e3ca07328ba4e103723f5f7aba9a878838d74f
class JobmanControl < Formula
  desc "Shared PostgreSQL-backed control plane for Jobman"
  homepage "https://github.com/ryancswallace/jobman-control"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.4.2/jobman-control_0.4.2_darwin_amd64.tar.gz"
      sha256 "6f7cfe697077b0da6e5abf796bba94230622af3fc4163c3a6f7f3f0dcfde3ce1"
    end
    on_arm do
      url "https://github.com/ryancswallace/jobman-control/releases/download/v0.4.2/jobman-control_0.4.2_darwin_arm64.tar.gz"
      sha256 "318ee2d6f46054b935f1f44fbb79ab7ba5096be6db372877583b9845dc37300f"
    end
  end

  def install
    bin.install "jobman-control"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-control 0.4.2", shell_output("#{bin}/jobman-control --version")
  end
end
