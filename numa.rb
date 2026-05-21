class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.19.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.19.0/numa-macos-aarch64.tar.gz"
      sha256 "fe47792ff7679bc5e0702d7930ea0894299092e8571173e533dd5b543ffdbd9e"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.19.0/numa-macos-x86_64.tar.gz"
      sha256 "940797ae94b6d194d45fbdaddb2c3590a1b60817c579403307bcc44b29f0d378"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.19.0/numa-linux-aarch64.tar.gz"
      sha256 "13e921747a8304e248ad320a79bb180fdec2432462ba8c53c4cbb7da34e69c12"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.19.0/numa-linux-x86_64.tar.gz"
      sha256 "aa56438ac621142dc84bba6446c25eb478893abd4b6f610dcc43cb063df3455e"
    end
  end

  def install
    bin.install "numa"
  end

  def caveats
    <<~EOS
      Numa requires root to bind port 53:
        sudo numa                    # start the DNS server
        sudo numa install            # set as system DNS
        sudo numa service start      # run as persistent service

      Dashboard: http://localhost:5380
    EOS
  end

  test do
    assert_match "numa", shell_output("#{bin}/numa --version")
  end
end
