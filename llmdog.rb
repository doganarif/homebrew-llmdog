# frozen_string_literal: true
# typed: true
#
# Formula for llmdog, a tool to prepare files for LLM consumption.
class Llmdog < Formula
  desc "Prepare files for LLM consumption"
  homepage "https://github.com/doganarif/llmdog"
  license "MIT"
  version "2.0.0"

  if Hardware::CPU.arm?
    url "https://github.com/doganarif/llmdog/releases/download/v#{version}/llmdog_v#{version}_darwin_arm64.tar.gz"
    sha256 "726a42a3d2971c2598a5debf20747135eb1346d8357bc014d1c03f27d8939f6f"
  else
    url "https://github.com/doganarif/llmdog/releases/download/v#{version}/llmdog_v#{version}_darwin_amd64.tar.gz"
    sha256 "92dfd3557a84f56f880af569e32abc45d365eb5369353b35a597cc27b63a5a07"
  end

  depends_on "go" => :build

  def install
    # The tarball contains the binary named "llmdog"
    bin.install "llmdog"
  end

  test do
    assert_match "llmdog version", shell_output("\#{bin}/llmdog --version")
  end
end
