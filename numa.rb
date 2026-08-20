class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.23.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.23.0/numa-macos-aarch64.tar.gz"
      sha256 "d17352953f63494f8e480b21c8f17ab92fecfbf2831511c056e306df5f16c712"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.23.0/numa-macos-x86_64.tar.gz"
      sha256 "821110eca570cd63065f938d173fb8a9df3ca3ee318e087f6ee16221b697abfe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.23.0/numa-linux-aarch64.tar.gz"
      sha256 "18113346d6d4c12bd37a9f945fa823d001223e688cd51aec757f3337c96ec9b8"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.23.0/numa-linux-x86_64.tar.gz"
      sha256 "fba530d5ec2a260399728e76e966a583b09196825ee2a879f537b13226713efc"
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
