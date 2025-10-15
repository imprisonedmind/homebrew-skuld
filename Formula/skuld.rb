class Skuld < Formula
  desc "Skuld: WakaTime + Git → Jira worklogs"
  homepage "https://github.com/imprisonedmind/skuld"
  url "https://github.com/imprisonedmind/skuld/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "188794cb6b97691debadf49b2cc6e99331a0f22e8925ccff156ddb1f185ed122"
  license "mit"
  head "https://github.com/imprisonedmind/skuld.git", branch: "main"

  depends_on "python"

  def install
    libexec.install Dir["skuld", "docs", ".skuld.yaml.example", "README.md", "LICENSE"]
    (bin/"skuld").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}"
      exec "#{Formula["python"].opt_bin}/python3" -m skuld.cli "$@"
    EOS
    (bin/"skuld").chmod 0755
  end

  test do
    system "#{bin}/skuld", "--help"
  end
end
