class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.15.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.15.1/numa-macos-aarch64.tar.gz"
      sha256 "9e3494f02636add194861f19c409b0243a633276f843941fb87985e11f843b60"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.15.1/numa-macos-x86_64.tar.gz"
      sha256 "8dbbc16fec991b145db750530012f959a2fa08e5c628ccd15e2d8838cdfbff6a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.15.1/numa-linux-aarch64.tar.gz"
      sha256 "91caa19220129c96c6710bf920bce7a086d93bd239e6619fc25b2e3f0e0e078c"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.15.1/numa-linux-x86_64.tar.gz"
      sha256 "fe4aace295453f8eca70b1a66050d19075cf423fc4ea9730e1c564e3f9d690b9"
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
