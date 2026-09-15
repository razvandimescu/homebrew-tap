class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.23.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.23.1/numa-macos-aarch64.tar.gz"
      sha256 "356aa03c4ff5572d457f33b4ac5b5d69a4c337a30b6d865849902737c46fbef0"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.23.1/numa-macos-x86_64.tar.gz"
      sha256 "88f6606c3e2147982118445c83df597c85dcc46ee8e19229e7ce3d2e58a5960a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.23.1/numa-linux-aarch64.tar.gz"
      sha256 "e87d89ef41942d697e5f0d11b254170ff462f16232d7fd07cbb4aeae30ea8ea8"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.23.1/numa-linux-x86_64.tar.gz"
      sha256 "dd57f87d34d2d84a419942962edb8fd786b1646aa9a5d1fcc79a154a0eba2202"
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
