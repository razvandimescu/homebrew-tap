class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.11.0/numa-macos-aarch64.tar.gz"
      sha256 "ef2a3ec11361c56c89457c8b8d092af373d21bbf41433a8d9f294350db91c082"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.11.0/numa-macos-x86_64.tar.gz"
      sha256 "33fba3c96cbbbc383885c082e4f8be6092576de9cd8db23d529de4714cae4c5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.11.0/numa-linux-aarch64.tar.gz"
      sha256 "5bdac0052018be8906cf4a04a15c26d4127b30ce55e5ece9d898a48f2e19bbc7"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.11.0/numa-linux-x86_64.tar.gz"
      sha256 "2a1d2c7baaa4171758c9a9674fe5ca8db2aaf5ff8bf8415453e4500ba78ced58"
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
