# typed: strict
# frozen_string_literal: true

# Installs the Jobman Diagnose companion from its verified release archive.
class JobmanDiagnose < Formula
  desc "Deterministic and AI-assisted diagnostics for Jobman failures"
  homepage "https://github.com/ryancswallace/Jobman-Diagnose"
  license "MIT"

  depends_on "jobman"
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.7.0/jobman-diagnose_0.7.0_darwin_amd64.tar.gz"
      sha256 "10b6c7d74ddcc4bed60e4d00e110dee0d17a7f3a564622bd5bcdeda91efe286d"
    end
    on_arm do
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.7.0/jobman-diagnose_0.7.0_darwin_arm64.tar.gz"
      sha256 "ce3fb61d3d1451fe2c6f932453b6b3e907fa072ed73a3dd045369a3765ddaa39"
    end
  end

  def install
    bin.install "jobman-diagnose"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-diagnose 0.7.0", shell_output("#{bin}/jobman-diagnose --version")
  end
end
