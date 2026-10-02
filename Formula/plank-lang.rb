class PlankLang < Formula
  desc "Compiled language you can read in an evening: one Python file on LLVM"
  homepage "https://plank.heyitsmejosh.com"
  url "https://github.com/nulljosh/plank/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "970a35c4be1d2ac66cddc8dee64456f8e591b24aabf4adda4cb90a9adc892e64"
  license "MIT"

  depends_on "uv"

  conflicts_with "plank", because: "both install a plank binary; this one is the language"

  def install
    bin.install "plank.py" => "plank"
  end

  test do
    (testpath/"hi.pk").write "fn main() {\n  print(\"hi\")\n}\n"
    assert_equal "hi\n", shell_output("#{bin}/plank run #{testpath}/hi.pk")
  end
end
