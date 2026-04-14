class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.13.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.13.1/numa-macos-aarch64.tar.gz"
      sha256 "e4171b26a8f8d0318db9fc498c50c82b136891328c7ac5ca27152a585779c340"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.13.1/numa-macos-x86_64.tar.gz"
      sha256 "c60fc2d2d86ebfa4ec1dc8e4d31c3336718b3670384b9d7b2475eac6ce163f07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.13.1/numa-linux-aarch64.tar.gz"
      sha256 "09fd3ab182b1ecb5f6a81799aa840eaa13100ee74675c196b4291b2c28d8d4a2"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.13.1/numa-linux-x86_64.tar.gz"
      sha256 "539bdc4b6fe58819b855f8e1f001b078322ef830e1eed68f7f25dc5409d13569"
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
