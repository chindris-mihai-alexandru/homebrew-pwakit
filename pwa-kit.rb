class PwaKit < Formula
  desc "The macOS toolkit for progressive web apps"
  homepage "https://github.com/chindris-mihai-alexandru/PWA-Kit"
  url "https://github.com/chindris-mihai-alexandru/PWA-Kit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "59d73abad9b7b404026726dc96f016de0e2d9c554155c61f7747b55fd0e433ef"
  license "GPL-3.0"
  
  depends_on xcode: ["14.0", :build]
  depends_on :macos => :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/PWAKit_static" => "pwakit"
  end

  test do
    assert_match "PWA-Kit", shell_output("#{bin}/pwakit --version")
  end
end
