class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.14.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.1/numa-macos-aarch64.tar.gz"
      sha256 "d1549c166bd26902d96235c5b34c2a750b1d0c87c4687bd6036cbd19baf0f4d4"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.1/numa-macos-x86_64.tar.gz"
      sha256 "61f18b99ee884356ee4b92f72548931ec32b31854803aee0a987cf3396640544"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.1/numa-linux-aarch64.tar.gz"
      sha256 "ce4f2f9d7f3f37b3c44b8df42a254b2fa3f265b6de6337f0eece92f618117cde"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.1/numa-linux-x86_64.tar.gz"
      sha256 "521fb0bd31622a666559c59cbb8e090eb04ec5b79a4baec564e5af50c047abb1"
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
