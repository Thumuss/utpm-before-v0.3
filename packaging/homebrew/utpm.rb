class Utpm < Formula
  desc "Unofficial Typst Package Manager"
  homepage "https://github.com/typst-community/utpm"
  url "https://github.com/typst-community/utpm/archive/refs/tags/v0.3.6.tar.gz"
  sha256 "0d3876c44d47794ff7c1dc45687152ebb9eea7c3a967c7542b832e1b36a7718a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
    
    # Generate and install shell completions
    generate_completions_from_executable(bin/"utpm", "generate")
    
    # Install documentation
    doc.install "docs/GUIDE.md"
  end

  test do
    assert_match "utpm", shell_output("#{bin}/utpm --version")
  end
end
