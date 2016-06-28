class Miranda < Formula
  desc "microRNA Target Detection Software"
  homepage "http://www.microrna.org/microrna/home.do"
  url "http://cbio.mskcc.org/microrna_data/miRanda-aug2010.tar.gz"
  version "3.3a"
  sha256 "a671da562cf4636ef5085b27349df2df2f335774663fd423deb08f31212ec778"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/miranda --help 2>&1"
  end
end
