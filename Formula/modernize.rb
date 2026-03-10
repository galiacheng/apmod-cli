class Modernize < Formula
  desc "AI-powered CLI for application modernization"
  homepage "https://github.com/galiacheng/apmod-cli"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/galiacheng/apmod-cli/releases/latest/download/modernize_darwin_x64.tar.gz"
    elsif Hardware::CPU.arm?
      url "https://github.com/galiacheng/apmod-cli/releases/latest/download/modernize_darwin_arm64.tar.gz"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/galiacheng/apmod-cli/releases/latest/download/modernize_linux_x64.tar.gz"
    elsif Hardware::CPU.arm?
      url "https://github.com/galiacheng/apmod-cli/releases/latest/download/modernize_linux_arm64.tar.gz"
    end
  end

  license :cannot_represent

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