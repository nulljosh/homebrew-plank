class PlankLang < Formula
  desc "Compiled language you can read in an evening: one Python file on LLVM"
  homepage "https://plank.heyitsmejosh.com"
  url "https://github.com/nulljosh/plank/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "af611b9d798df7215e24185befa202c2ef1033dccc79402e907a5af186b59e1e"
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
