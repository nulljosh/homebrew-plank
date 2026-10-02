class PlankLang < Formula
  desc "Compiled language you can read in an evening: one Python file on LLVM"
  homepage "https://plank.heyitsmejosh.com"
  url "https://github.com/nulljosh/plank/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "830f40e3893047dc417f1b84fc0346ce4e66262dc74236507283226b0f525f87"
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
