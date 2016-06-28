class Ampliconnoise < Formula
  desc "Removal of noise from 454 sequenced PCR amplicons"
  homepage "https://code.google.com/p/ampliconnoise/"
  url "https://ampliconnoise.googlecode.com/files/AmpliconNoiseV1.27.tar.gz"
  sha256 "05d8594bb0900675363761a25f4b1982e63c3b85c5d5cc5e54164f456843d99d"

  #depends_on "gsl"
  depends_on "mafft"
  depends_on :mpi => :cc

  def install
    system "make", "clean"
    system "make"
    system "make", "install"
    bin.install Dir.glob("bin/*")
  end

  test do
    system "./Test/Run.sh"
  end
end
