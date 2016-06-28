class Squashfuse < Formula
  desc "Mount SquashFS archives using FUSE"
  homepage "https://github.com/vasi/squashfuse"
  url "https://downloads.sourceforge.net/project/squashfuse/squashfuse/squashfuse-0.1/squashfuse-0.1.tar.gz"
  sha256 "ece36908d23d3ded2aa030bcde7a1759483fd5ee3e246d7f012a4f6459c885f7"

  depends_on "zlib"
  depends_on "lzo"
  depends_on "pkg-config" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/squashfuse --help 2>&1"
  end
end
