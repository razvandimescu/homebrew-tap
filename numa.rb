class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.20.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.20.0/numa-macos-aarch64.tar.gz"
      sha256 "e033254ba1854cb1a7c9fb6f6183c233e9cd7584d059c33a125cd55b57012dd1"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.20.0/numa-macos-x86_64.tar.gz"
      sha256 "3331782d1aee40443232bd52fdf2f81dc0c6fbd75848e0d1f3cf6ee2357e5679"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.20.0/numa-linux-aarch64.tar.gz"
      sha256 "f8e9f780b77afc8120a400bf3218e57747a4b251026e73b4f7566fc3eadb5ee0"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.20.0/numa-linux-x86_64.tar.gz"
      sha256 "d5e65184a51cbb839e4efe1f40beffa82862d243c12dfdb5b80ba684e0db13e8"
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
