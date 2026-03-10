class AppmodCli < Formula
  desc "CLI tool for Java application modernization"
  homepage "https://github.com/galiacheng/apmod-cli"
  url "https://github.com/galiacheng/apmod-cli/releases/download/0.0.211/modernize_0.0.211_linux_x64.tar.gz"
  sha256 "3b417f9df6cbedc2976655d2ca1ad4f867f49acd8e58ed18c5a1c027912e64cf"
  license "MIT"

  def install
    libexec.install "modernize"
    libexec.install "runtimes"
    bin.install_symlink libexec/"modernize"
  end

  test do
    version_output = shell_output "#{bin}/modernize --version"
    assert_equal 0, $CHILD_STATUS.exitstatus
    assert_match "modernize", version_output
  end
end