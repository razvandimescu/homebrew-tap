class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.10.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.3/numa-macos-aarch64.tar.gz"
      sha256 "cbebff4cd03caf06ec8d325d7188ffe77047d5b181355ce8c8953f9af8ad1cf6"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.3/numa-macos-x86_64.tar.gz"
      sha256 "473b77115a2280a4188fab5df576d3cf14a19d0e0f133de4d9752281836ee121"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.3/numa-linux-aarch64.tar.gz"
      sha256 "2b096b77d21462cd78fe3647fa309cbfefb16d73284dbc36d88f14ca6ab6be83"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.3/numa-linux-x86_64.tar.gz"
      sha256 "d7d3a364f329d11e9e57fbd6707728f31f0db5f2927ce7916fc9cdd7c5e3eda7"
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
