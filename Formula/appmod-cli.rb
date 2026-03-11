class AppmodCli < Formula
  desc "CLI tool for Java application modernization"
  homepage "https://github.com/galiacheng/apmod-cli"
  url "https://github.com/microsoft/modernize-cli/releases/download/v0.0.226/modernize_0.0.226_linux_x64.tar.gz"
  sha256 "fdc582131e933f8fbe978da7601c9d2cdf40044305adc93c668ab501dee11f58"
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