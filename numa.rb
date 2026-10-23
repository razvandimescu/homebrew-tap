class Numa < Formula
  desc "Portable DNS resolver with ad blocking, .numa local service proxy, and developer overrides"
  homepage "https://github.com/razvandimescu/numa"
  license "MIT"
  version "0.25.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.0/numa-macos-aarch64.tar.gz"
      sha256 "be2d93d7c2609e092d2ecdc5634e65b0be0c28325479cf996bff0eb7dfbe5084"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.0/numa-macos-x86_64.tar.gz"
      sha256 "fd7b06c8bea3e7f1a0c91bdd92fb140532f82e643abeecaca51542200f5db780"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.0/numa-linux-aarch64.tar.gz"
      sha256 "2d25f89391776ffe85a9e716047b3f0832aea69bfa63bbec544e02a4e18571b2"
    else
      url "https://github.com/razvandimescu/numa/releases/download/v0.25.0/numa-linux-x86_64.tar.gz"
      sha256 "021b68282d97105ed7757e54903085b5687b490201007242dd35238bafe47a1a"
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
