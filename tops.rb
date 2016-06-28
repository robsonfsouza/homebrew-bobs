class Tops < Formula
  desc "Toolkit of Probabilistic Model of Sequence"
  homepage "https://github.com/ayoshiaki/tops"
  url "https://codeload.github.com/ayoshiaki/tops/tar.gz/master"
  version "0.1"
  sha256 "654b8d31d02354ad516949f37dda9bbb55ac1e3979b52a16a260a913f5dd4805"

  depends_on "cmake" => :build
  depends_on "boost" => :build
  
  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/evaluate --help 2>&1"
  end
end
