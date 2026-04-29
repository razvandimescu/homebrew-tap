class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.14.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.3/numa-macos-aarch64.tar.gz"
      sha256 "22f51e17166cfeb3b4783dc001b577ee511764eac4d8165090219c2d22c0cbb5"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.3/numa-macos-x86_64.tar.gz"
      sha256 "ef7c1c8b6e13aa60f16ab120fc944ca92021e7a70b0f9e3ca2b7d2dc872acf2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.3/numa-linux-aarch64.tar.gz"
      sha256 "393f99ecfbbc36a833a1b91d6421815097bb33b2129924c71003481cb8b83abd"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.3/numa-linux-x86_64.tar.gz"
      sha256 "03e676b71c831fa311d3190ce40d697e38c7daadc06395ef163ed0d87c75b69f"
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
