class ElcAT110 < Formula
  desc "Tool for deploying microservices on developer machine"
  homepage "https://github.com/ensi-platform/elc"
  url "https://github.com/ensi-platform/elc/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b213c51af8385a0eaf4ee3b7105d0c9e37d5948c585921abfbc159a2810962e3"
  license "MIT"

  depends_on "go" => :build
  on_macos do
    depends_on "bash" => :build
    depends_on "coreutils" => :build
  end

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-X github.com/ensi-platform/elc/core.Version=v1.1.0"
    system "go", "get"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    system "#{bin}/elc", "--version"
  end
end
