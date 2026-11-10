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
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.7.1/jobman-diagnose_0.7.1_darwin_amd64.tar.gz"
      sha256 "d5adc937a9ce740ac1e48635ec0e57ca29a00bbb0faad6d6a143b9a6105b0aa7"
    end
    on_arm do
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.7.1/jobman-diagnose_0.7.1_darwin_arm64.tar.gz"
      sha256 "e8763f674e3183713b1dacb06b4032c5de755a22e56a25d1053d40fe139cb50b"
    end
  end

  def install
    bin.install "jobman-diagnose"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-diagnose 0.7.1", shell_output("#{bin}/jobman-diagnose --version")
  end
end
