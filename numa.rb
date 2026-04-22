class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.14.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.2/numa-macos-aarch64.tar.gz"
      sha256 "1e5c62aa05551ee0f3ef604326c5851b1a2e43141574ef4d16342783b939e92e"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.2/numa-macos-x86_64.tar.gz"
      sha256 "c5232850d188f09f4522b1dccc48524eeaeca20895be8203de2b8400ea92cced"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.2/numa-linux-aarch64.tar.gz"
      sha256 "c55c1b806e16d1bc02dc3c7ac97e80a3b4a67627aff1a760304e1d674ccff023"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.14.2/numa-linux-x86_64.tar.gz"
      sha256 "bdb70d04e1134bf906b213f129c0113eb1219bf8bb402a6a33dd965fde74367f"
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
