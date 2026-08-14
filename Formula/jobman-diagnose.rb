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
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.6.0/jobman-diagnose_0.6.0_darwin_amd64.tar.gz"
      sha256 "9ad39dec8a593c8441358c65fbf52fd2986be9a69031ed682dc5e14a84f6adc3"
    end
    on_arm do
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.6.0/jobman-diagnose_0.6.0_darwin_arm64.tar.gz"
      sha256 "f8487fa229b0a620cb70ea34f2363d852087065f0064aea6a587029b39bff562"
    end
  end

  def install
    bin.install "jobman-diagnose"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-diagnose 0.6.0", shell_output("#{bin}/jobman-diagnose --version")
  end
end
