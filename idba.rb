class Idba < Formula
  homepage "http://i.cs.hku.hk/~alse/hkubrg/projects/idba/"
  # doi "10.1093/bioinformatics/bts174"
  # tag "bioinformatics"

  url "https://codeload.github.com/loneknightpy/idba/tar.gz/master"
  sha256 "1e0dd0a8aec012418cec3bee865bfb9e9fa2525462bc60536c9878884e3b4d25"

  bottle do
    cellar :any
    sha256 "9ce6a82cee5d4a891f1dfe38a9a6a9d2a409f9fe9d2193c54cce498a53897eef" => :yosemite
    sha256 "066ff8986d811ee9190db54c6fbfb77fde054ef0c096800438fa2338a4badec6" => :mavericks
    sha256 "10bf4be36d3797c48f58580078ee2d197227cdb297f5b2ba826590fd4ba92983" => :mountain_lion
    sha256 "b388e1426c8c92637246a8dd21487ff0b4d31c4f15073892211be12e65a3c9eb" => :x86_64_linux
  end

  fails_with :clang do
    build 600
    cause "Requires OpenMP"
  end

  def install
    system "./configure",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}"
    system "make"
    bin.install Dir["bin/idba*"].select { |x| File.executable? x }
    libexec.install Dir["bin/*"].select { |x| File.executable? x }
    doc.install %w[AUTHORS ChangeLog NEWS README]
  end

  test do
    system "#{bin}/idba_ud 2>&1 |grep IDBA"
  end
end
