class ElcAT111 < Formula
  desc "Tool for deploying microservices on developer machine"
  homepage "https://github.com/ensi-platform/elc"
  url "https://github.com/ensi-platform/elc/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "acc6f99aa415bca36548161c2793e9bcbd9c23fb10f820231b37c7a88b057198"
  license "MIT"

  depends_on "go" => :build
  on_macos do
    depends_on "bash" => :build
    depends_on "coreutils" => :build
  end

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-X github.com/ensi-platform/elc/core.Version=v1.1.1"
    system "go", "get"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    system "#{bin}/elc", "--version"
  end
end
