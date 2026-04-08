class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.0/numa-macos-aarch64.tar.gz"
      sha256 "0806eccfcf8ed78c7e19983b64de3659bf6e9f2faee60a52bb7e2485626373f9"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.0/numa-macos-x86_64.tar.gz"
      sha256 "fc6d0b2a2414f2409b6b3460e05853ffdd32d080c1f59f24c2fbfba1e7ce38ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.0/numa-linux-aarch64.tar.gz"
      sha256 "9e59a624fea5f56d816f04a41b0729c7c3d7c92e29a502924e6e9e2417fc1449"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.10.0/numa-linux-x86_64.tar.gz"
      sha256 "2eb850739af8d893d4ad9e9f0e42b65d7817c7356ee667a63fa42df393bf8f9c"
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
