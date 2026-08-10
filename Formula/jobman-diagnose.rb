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
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.3.0/jobman-diagnose_0.3.0_darwin_amd64.tar.gz"
      sha256 "1c5a2575a5cc5a36209eee90e2f25e32f4d65b11b8a2c7e0c9a3b4cc6ba63fde"
    end
    on_arm do
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.3.0/jobman-diagnose_0.3.0_darwin_arm64.tar.gz"
      sha256 "8c72019395aa1b5bc45368e60f9bf1308851a9b507fc37ee57ab9deaee4a567c"
    end
  end

  def install
    bin.install "jobman-diagnose"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-diagnose 0.3.0", shell_output("#{bin}/jobman-diagnose --version")
  end
end
