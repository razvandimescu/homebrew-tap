class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.0/numa-macos-aarch64.tar.gz"
      sha256 "481a1a18c4b3a8a696b6a8fc9cd3048a38be79136bf89e6b0f3894226f04033a"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.0/numa-macos-x86_64.tar.gz"
      sha256 "5929ba95c4d87c7302335e64d1d1d4dc3673acd612be3be5134290253c7629a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.0/numa-linux-aarch64.tar.gz"
      sha256 "b27c5ecf06725903a52cf73be25ba047aff1c0915eed47964a9c5ba9b7f3f787"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.0/numa-linux-x86_64.tar.gz"
      sha256 "ceb18a97f259582057af7486f556e05b20b54189c221e8e50f8b6b71e8f47f48"
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
