class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.24.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.24.0/numa-macos-aarch64.tar.gz"
      sha256 "1b3c6cfa2f8f047810966d5cb6977c6ad5ee7f01f79f63350fd8c4c1496c3609"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.24.0/numa-macos-x86_64.tar.gz"
      sha256 "1f48620a73fe0f0162f3c751dabe592e295c29f71505487d94ffb9d7a457b386"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.24.0/numa-linux-aarch64.tar.gz"
      sha256 "70fe76de732cc9a7e7d738c3c675c5d58bd00c12e033dc372fd5fd578fa8174c"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.24.0/numa-linux-x86_64.tar.gz"
      sha256 "f44d8044a5f9f67b89eb7b8487b67707f13d00a86959ab751a71b1fc37f0a7f5"
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
