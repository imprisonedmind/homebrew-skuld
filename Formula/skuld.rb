class Skuld < Formula
  desc "Skuld: WakaTime + Git → Jira worklogs"
  homepage "https://github.com/imprisonedmind/skuld"
  url "https://github.com/imprisonedmind/skuld/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "359d43fba089ef89043c12aa0dce4de8f07ab1158829cabc88b223bd93626af6"
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
