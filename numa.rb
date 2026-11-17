class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.25.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.2/numa-macos-aarch64.tar.gz"
      sha256 "dc1af02e8a470f5c175a219fe299ef6bc5709c15afc339190f5b18b63c5297a9"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.2/numa-macos-x86_64.tar.gz"
      sha256 "560a53f309daa7e7d95dff4d560a95ba08f727e0e9a73172dfc6e5a0b6469db9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.2/numa-linux-aarch64.tar.gz"
      sha256 "dac50032c05f6ee406a6e629d7975ed1e3acfb9b14ebca27ad3827de21116c37"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.2/numa-linux-x86_64.tar.gz"
      sha256 "4f56da3ee872839db26b82510d047688b859dda15ecde10812cd24caafda292a"
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
