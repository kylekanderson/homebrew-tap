class Conduit < Formula
  desc "TUI for monitoring Bitbucket Cloud pipelines"
  homepage "https://github.com/kylekanderson/conduit"
  url "https://github.com/kylekanderson/conduit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5cfe6ccb82711110b87d717adc2b26298b271563b17a3d3d10b18439e8d17e45"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"conduit", "."
  end

  test do
    assert_match "conduit", shell_output("#{bin}/conduit --help")
  end
end
