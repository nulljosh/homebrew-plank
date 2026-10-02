class Plank < Formula
  desc "Compiled language you can read in an evening: one Python file on LLVM"
  homepage "https://plank.heyitsmejosh.com"
  url "https://github.com/nulljosh/plank/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "3db9c8663392743719ae759205b5345ed688ac3b66c6656ffa6b1eb614220df8"
  license "MIT"

  depends_on "uv"

  def install
    bin.install "plank.py" => "plank"
  end

  test do
    (testpath/"hi.pk").write "fn main() {\n  print(\"hi\")\n}\n"
    assert_equal "hi\n", shell_output("#{bin}/plank run #{testpath}/hi.pk")
  end
end
