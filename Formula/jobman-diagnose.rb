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
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.5.0/jobman-diagnose_0.5.0_darwin_amd64.tar.gz"
      sha256 "d71c97521fc43a5c0944a9edc3d707d789030d87f8c1535caf1ced700bcc9da1"
    end
    on_arm do
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.5.0/jobman-diagnose_0.5.0_darwin_arm64.tar.gz"
      sha256 "a7df7591dc9909f0a633e98d48e7132ee1ac668aadf5069166a36a9d4c421860"
    end
  end

  def install
    bin.install "jobman-diagnose"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-diagnose 0.5.0", shell_output("#{bin}/jobman-diagnose --version")
  end
end
