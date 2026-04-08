class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.10.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.1/numa-macos-aarch64.tar.gz"
      sha256 "b0b0a6ba844c6bef285b4c0c95608fcc92572114cc6099ed7e7e1530d64875ef"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.1/numa-macos-x86_64.tar.gz"
      sha256 "c53b09c5da1ab8f9d22df6f104e4b4a52b3ca0aa25438371b24e4a14158844ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.1/numa-linux-aarch64.tar.gz"
      sha256 "02a1683b4333bc43743feef1ab49899ccaa58c13e34825e7583157a691d9184b"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.1/numa-linux-x86_64.tar.gz"
      sha256 "15b7fa9c22a2c57a8afcf1d8949c130cee3d470b983a29cc50fc7fffeea5f82c"
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
