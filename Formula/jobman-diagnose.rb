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
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.2.0/jobman-diagnose_0.2.0_darwin_amd64.tar.gz"
      sha256 "0acd0bf983002a82dfc8abf24e3eada7e8e644a7a66e0a065ee6a67093508ceb"
    end
    on_arm do
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.2.0/jobman-diagnose_0.2.0_darwin_arm64.tar.gz"
      sha256 "f334f86cbbe5b40f039a62a5704e30f5c4bff8563f2c05c31538b48572b33b33"
    end
  end

  def install
    bin.install "jobman-diagnose"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-diagnose 0.2.0", shell_output("#{bin}/jobman-diagnose --version")
  end
end
