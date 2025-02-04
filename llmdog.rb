# frozen_string_literal: true
# typed: true
#
# Formula for llmdog, a tool to prepare files for LLM consumption.
class Llmdog < Formula
  desc "Prepare files for LLM consumption"
  homepage "https://github.com/doganarif/llmdog"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/doganarif/llmdog/releases/download/v1.0.0/llmdog_v1.0.0_darwin_arm64.tar.gz"
    sha256 "96496c24f95541d383bfbe000fb56eb81f9ed928fade243a5f858b044223422d"
  else
    url "https://github.com/doganarif/llmdog/releases/download/v1.0.0/llmdog_v1.0.0_darwin_amd64.tar.gz"
    sha256 "e78ea3fafb928d9979dd95820af54ea34b01be7e334391305f23b39619366bfc"
  end

  depends_on "go" => :build

  test do
    assert_match "llmdog version", shell_output("#{bin}/llmdog --version")
  end
end