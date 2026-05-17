class ElcAT100 < Formula
  desc "Tool for deploying microservices on developer machine"
  homepage "https://github.com/ensi-platform/elc"
  url "https://github.com/ensi-platform/elc/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8230e6185786c6c06f0494c6a39a438970ce5260909ec0e73ad5a68229f18fcd"
  license "MIT"

  depends_on "go" => :build
  on_macos do
    depends_on "bash" => :build
    depends_on "coreutils" => :build
  end

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-X github.com/ensi-platform/elc/core.Version=v1.0.0"
    system "go", "get"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    system "#{bin}/elc", "--version"
  end
end
