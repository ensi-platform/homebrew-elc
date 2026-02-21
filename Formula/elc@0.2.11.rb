class Elc < Formula
  desc "Tool for deploying microservices on developer machine"
  homepage "https://github.com/ensi-platform/elc"
  url "https://github.com/ensi-platform/elc/archive/refs/tags/v0.2.11.tar.gz"
  sha256 "466cec3b6fd7a9b34106f0784826fe0d492d76c52b8d03bf0fd3c6cae45f9b05"
  license "MIT"

  depends_on "go" => :build
  on_macos do
    depends_on "bash" => :build
    depends_on "coreutils" => :build
  end

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-X github.com/ensi-platform/elc/core.Version=v0.2.11"
    system "go", "get"
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    system "#{bin}/elc", "--version"
  end
end
