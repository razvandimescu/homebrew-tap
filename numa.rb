class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.21.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.21.0/numa-macos-aarch64.tar.gz"
      sha256 "70372c62feefed108a3523ac07c42af35637e0d8a586318c90d868473ddd8ba4"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.21.0/numa-macos-x86_64.tar.gz"
      sha256 "20209ebb888b8f1aad0f4405849cf648d467fe842d484ba29ca2ac97769a51ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.21.0/numa-linux-aarch64.tar.gz"
      sha256 "639ce90bcea723c086448e02e8ea0787ba1ba2abe52b2359c55cb758dfaf70da"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.21.0/numa-linux-x86_64.tar.gz"
      sha256 "2db954f1aaa26df92bd4fa0d2631c48bb5242b3bf9741af3ec265b204041e12b"
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
