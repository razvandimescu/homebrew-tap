class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.18.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.18.0/numa-macos-aarch64.tar.gz"
      sha256 "3cea934da16b28ad694c1fb0c11269a5316b1cc567c7f3fee56c50c982734130"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.18.0/numa-macos-x86_64.tar.gz"
      sha256 "5f52e469637eb56da5d41a57237f29cafe66bef47a252dce86e79be14c4cf43f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.18.0/numa-linux-aarch64.tar.gz"
      sha256 "78974b6f5381cf588a55f3242694f9122194ea006b8d461b2e73bf0bb2b93710"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.18.0/numa-linux-x86_64.tar.gz"
      sha256 "a146c670139e8df3b6a78302c73269ffacc062b52005ce54e21b1db7953119a1"
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
