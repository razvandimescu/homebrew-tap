class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.24.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.24.1/numa-macos-aarch64.tar.gz"
      sha256 "3097d39b2defa6519f84b51f3058554eb7f4241880680a2a70cdf41b53bca0c9"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.24.1/numa-macos-x86_64.tar.gz"
      sha256 "83b04f44ba45840d0d74221105d2e0f75d25cccf9a376f51d7273a32e6d36ac6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.24.1/numa-linux-aarch64.tar.gz"
      sha256 "39aaba708075dd0e2d700dc219fca867c0fe18710ee589a143b88f0322d9a457"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.24.1/numa-linux-x86_64.tar.gz"
      sha256 "e926aee50a49e5d63f64dc8aa442525b50de0ab6c94064a2b6b0c4144bffc2ef"
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
