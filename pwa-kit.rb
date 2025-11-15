class PwaKit < Formula
  desc "The macOS toolkit for progressive web apps"
  homepage "https://github.com/chindris-mihai-alexandru/PWA-Kit"
  url "https://github.com/chindris-mihai-alexandru/PWA-Kit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"  # Will be updated with actual release
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
