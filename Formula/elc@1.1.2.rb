class ElcAT112 < Formula
  desc "Tool for deploying microservices on developer machine"
  homepage "https://github.com/ensi-platform/elc"
  url "https://github.com/ensi-platform/elc/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "6f3006ad32be935f854474ad811176786734d5f60dccc959289935e167946c8e"
  license "MIT"

  depends_on "go" => :build
  on_macos do
    depends_on "bash" => :build
    depends_on "coreutils" => :build
  end

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-X github.com/ensi-platform/elc/core.Version=v1.1.2"
    system "go", "get"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    system "#{bin}/elc", "--version"
  end
end
