# typed: strict
# frozen_string_literal: true

# Installs the Jobman Diagnose companion from its verified release archive.
class JobmanDiagnose < Formula
  desc "Deterministic and AI-assisted diagnostics for Jobman failures"
  homepage "https://github.com/ryancswallace/Jobman-Diagnose"
  version "0.1.0"
  license "MIT"

  depends_on "jobman"
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.1.0/jobman-diagnose_0.1.0_darwin_amd64.tar.gz"
      sha256 "b8bc68425be84af8ff2e040ffcc25de51900675032666159248c285c4c77235f"
    end
    on_arm do
      url "https://github.com/ryancswallace/Jobman-Diagnose/releases/download/v0.1.0/jobman-diagnose_0.1.0_darwin_arm64.tar.gz"
      sha256 "4a87015521001c2be86ba84e763f7ec2781b6ed897eda26bf1c49d4987b8df70"
    end
  end

  def install
    bin.install "jobman-diagnose"
    doc.install "README.md", "CHANGELOG.md", "SECURITY.md", "SUPPORT.md"
    (doc/"guides").install Dir["docs/*.md"]
  end

  test do
    assert_match "jobman-diagnose #{version}", shell_output("#{bin}/jobman-diagnose --version")
  end
end
