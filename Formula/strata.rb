class Strata < Formula
  desc "TUI database client for SQLite, MySQL/MariaDB, and PostgreSQL"
  homepage "https://github.com/lancodev/strata"
  url "https://github.com/lancodev/strata/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "1c94283140819c0ee2a6f31c8123eec081ab45a145f5d5bba70846ce38326854"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"strata", "./cmd/strata"
  end

  test do
    assert_match "strata #{version}", shell_output("#{bin}/strata --version")
  end
end
