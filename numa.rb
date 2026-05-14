class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.17.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.17.0/numa-macos-aarch64.tar.gz"
      sha256 "ba367bbbaa25494d82f8bc49f9efee7635e640e0be3dd90a1814ec0ff740e21c"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.17.0/numa-macos-x86_64.tar.gz"
      sha256 "73db10406042110c4336ddf43064897b4efcd4bea33ea88beb9cc081c1b76cd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.17.0/numa-linux-aarch64.tar.gz"
      sha256 "62bb617ff3e09a6324dbc0120a4b7ee883feee298cb26dff8776206587e09432"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.17.0/numa-linux-x86_64.tar.gz"
      sha256 "80fa45af0906b40e70f998a1308b695043c4d2e52a4935829866dfbfe95f7b94"
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
