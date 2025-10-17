class Skuld < Formula
  desc "Skuld: WakaTime + Git → Jira worklogs"
  homepage "https://github.com/imprisonedmind/skuld"
  url "https://github.com/imprisonedmind/skuld/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "6326210c882e6cd16a64934a778da2b5ef0b00a36dfa14527e0dda2737c80d34"
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
