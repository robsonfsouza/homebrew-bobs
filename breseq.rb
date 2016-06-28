class Breseq < Formula
  homepage "http://barricklab.org/twiki/bin/view/Lab/ToolsBacterialGenomeResequencing"
  url "https://github.com/barricklab/breseq/releases/download/v0.26.0/breseq-0.26.0-Source.tar.gz"
  #version "0.26.0"
  sha256 "983bfca110e1fe53025670a792f0e6cb742feb3b2947c1488e7e6043fe7aa2ee"

  depends_on "samtools"
  depends_on "bowtie2"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
    File.delete("#{bin}/samtools")
  end

  test do
    system "#{bin}/breseq -h 2>&1 | grep breseq"
  end
end
