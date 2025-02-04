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
    sha256 "d14ebd03e21f071d79f01c51f4656cf597f18c36f40a26a22565c909093dbed8"
  else
    url "https://github.com/doganarif/llmdog/releases/download/v1.0.0/llmdog_v1.0.0_darwin_amd64.tar.gz"
    sha256 "ab09606f4135c6cc19a528b463ee6468153c6ef6e7fb537dbb12abef466cd3c2"
  end

  depends_on "go" => :build

  def install
    # If the tarball already contains the binary as "llmdog", this is sufficient.
    # Otherwise, if the binary is named differently (e.g. "llmdog_arm64" or "llmdog_amd64"),
    # rename it to "llmdog" before installing.
    #
    # For example, you could uncomment and adjust the following lines if needed:
    # if Hardware::CPU.arm?
    #   mv "llmdog_arm64", "llmdog"
    # else
    #   mv "llmdog_amd64", "llmdog"
    # end
    bin.install "llmdog"
  end

  test do
    assert_match "llmdog version", shell_output("#{bin}/llmdog --version")
  end
end
