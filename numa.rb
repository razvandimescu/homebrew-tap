class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.25.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.1/numa-macos-aarch64.tar.gz"
      sha256 "4e4957a7a8c457cfb71ba8af482dd4da37ddf5db783c42e1445fde6205aaae49"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.1/numa-macos-x86_64.tar.gz"
      sha256 "ee4b099f1d891b7443beb6f2f6c873e9701ceaa8a52c46f95978e711a6dd52a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.1/numa-linux-aarch64.tar.gz"
      sha256 "be835c90ec5ba6de079f186f461f9a77f044143f1337baa5861cae8def8b3129"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.1/numa-linux-x86_64.tar.gz"
      sha256 "82a9c28607d325514e04dd0445f7fdeae0fb2f84f267c7800a1f0bcd5607f5e1"
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
