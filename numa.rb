class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.10.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.2/numa-macos-aarch64.tar.gz"
      sha256 "fde5f1bb59aefbaafcd9f5ce32cdfc559b05f8f5cce22dbd9ec07fc809e75f96"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.2/numa-macos-x86_64.tar.gz"
      sha256 "0302ece804f4a1c3bf605d8851b429044946e5e81bdf98f247fc745bdccd4547"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.2/numa-linux-aarch64.tar.gz"
      sha256 "b43a752572c7e30a2cc119ce123e1d056bade51f43b2121fabfbba775931a530"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.2/numa-linux-x86_64.tar.gz"
      sha256 "0d887c71fc301d400b471905ece81aa0b14bef3e8c096351a9b8f10a3085fba6"
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
