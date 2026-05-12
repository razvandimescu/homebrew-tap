class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.16.0/numa-macos-aarch64.tar.gz"
      sha256 "22e5c3239aaab88afc0737f19943dcac58980db0a07bd5ca113041c78e6a4af8"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.16.0/numa-macos-x86_64.tar.gz"
      sha256 "a2cc38253243d06f876b8603d4227f237aacc451de28bce06ad1a145026199cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.16.0/numa-linux-aarch64.tar.gz"
      sha256 "101b01aeb5f23b571c322315f6ead9b6a3bcb4c75990171b4b7dc73e90ada732"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.16.0/numa-linux-x86_64.tar.gz"
      sha256 "3439d74f12d68cbb4591fc7710204303a41098d921a254645463a25e3856bf5c"
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
