class Clearcut < Formula
  desc "The reference implementation for Relaxed Neighbor Joining (RNJ)"
  homepage "http://bioinformatics.hungry.com/clearcut/"
  url "http://bioinformatics.hungry.com/clearcut/clearcut-1.0.9.tar.gz"
  sha256 "b9d5a0d48af95d89fe0a8963123b9fc4fa25413cdadc9fcd28dce374173e3305"

  def install
    system "make"
    bin.install "clearcut"
  end

  test do
    system "#{bin}/clearcut --help 2>&1 | grep -i clearcut"
  end
end
