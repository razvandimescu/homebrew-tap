class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.12.0/numa-macos-aarch64.tar.gz"
      sha256 "6713e99599dd0c4c4bc07d0bdd57452b9e75d8bae35c97954432b515d98cb190"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.12.0/numa-macos-x86_64.tar.gz"
      sha256 "4495c56bb04a1d7a7429251781b040fae69e37df1a9b702c35c9c2782a1677aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.12.0/numa-linux-aarch64.tar.gz"
      sha256 "bc72648ad79e0f161b3b40a2a11bf0bcbdc0cd1b3de9f5e81b591050ba0a204c"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.12.0/numa-linux-x86_64.tar.gz"
      sha256 "af29607c84a33710b0d42535e799a544f2263c5e86b3c4cf51d209ad9fb1d15b"
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
