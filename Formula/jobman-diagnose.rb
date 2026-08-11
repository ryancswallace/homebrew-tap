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
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.4.0/jobman-diagnose_0.4.0_darwin_amd64.tar.gz"
      sha256 "d567b5b7445ea96fbb2989dbcf267a6cf09be0d5b3595d013912d0694c1b6762"
    end
    on_arm do
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.4.0/jobman-diagnose_0.4.0_darwin_arm64.tar.gz"
      sha256 "cba90523069fbb7869b7d07e757204bc25710a2adab2982a5fe9c665b1493bc7"
    end
  end

  def install
    bin.install "jobman-diagnose"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-diagnose 0.4.0", shell_output("#{bin}/jobman-diagnose --version")
  end
end
