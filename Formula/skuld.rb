class Skuld < Formula
  desc "Skuld: WakaTime + Git → Jira worklogs"
  homepage "https://github.com/imprisonedmind/skuld"
  url "https://github.com/imprisonedmind/skuld/archive/refs/tags/v0.1.17.tar.gz"
  sha256 "79893ce5e02ed46c0c6c302229e0a10252fb3d0128ead68babc97b4e5e32eb1c"
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
