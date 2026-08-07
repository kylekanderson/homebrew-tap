class Conduit < Formula
  desc "TUI for monitoring Bitbucket Cloud pipelines"
  homepage "https://github.com/lancodev/conduit"
  url "https://github.com/lancodev/conduit/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "05a3cf415087c9a1ae70e66be577bd8d2447569dfb010cf4f943cd2b91e5df78"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"conduit", "."
  end

  test do
    assert_match "conduit", shell_output("#{bin}/conduit --help")
  end
end
