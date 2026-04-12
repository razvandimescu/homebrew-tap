class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.13.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.13.0/numa-macos-aarch64.tar.gz"
      sha256 "1cbc646b361f26adeb4278628650f5a80b36fe827c8a8452e24bd6e6bf8669e4"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.13.0/numa-macos-x86_64.tar.gz"
      sha256 "0043f37c0e8f8e890b4a3ab7540b24b83dc05538169c5b77ccbcf57199be78a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.13.0/numa-linux-aarch64.tar.gz"
      sha256 "5e20046bfe4f13d602a1c5eb9055d4695562c70bd3565e419fe6bd049a483db6"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.13.0/numa-linux-x86_64.tar.gz"
      sha256 "62527ea7c3ddd58d53dd7313c2fad21e4288bae8521d50931328722a0010a130"
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
