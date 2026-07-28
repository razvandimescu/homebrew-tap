class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.22.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.22.0/numa-macos-aarch64.tar.gz"
      sha256 "eddf3fbef5130c5fb1a8b5cccd59905ff4a10185b8d6e614904e53905d28e3e2"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.22.0/numa-macos-x86_64.tar.gz"
      sha256 "c68a60c204553c2fa5bd1024a2b7bec184632a4374c28a837ee09b8a7ce37838"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.22.0/numa-linux-aarch64.tar.gz"
      sha256 "eb50659c4321654433b13c05f59ff71d01c69f7cfbda72c1074961eb9809faba"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.22.0/numa-linux-x86_64.tar.gz"
      sha256 "0560125da08ce7b5daa08c9df79025034017556b002d5331cb15274aa7f3ec3c"
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
