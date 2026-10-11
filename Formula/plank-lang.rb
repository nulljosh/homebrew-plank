class PlankLang < Formula
  desc "Compiled language you can read in an evening: one Python file on LLVM"
  homepage "https://plank.heyitsmejosh.com"
  url "https://github.com/nulljosh/plank/archive/refs/tags/v4.5.0.tar.gz"
  sha256 "ee2f108f9e05956a87da8d17e42baaa9e2e90f93e2368c39f086d6efc11901de"
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
