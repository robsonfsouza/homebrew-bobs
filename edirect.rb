class Edirect < Formula
  desc "Access NCBI's databases from the shell"
  homepage "http://www.ncbi.nlm.nih.gov/books/NBK179288/"
  head "ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/versions/current/edirect.tar.gz"
  # tag "bioinformatics"

  depends_on "HTML::Entities" => :perl
  depends_on "LWP::Simple" => :perl
  depends_on "LWP::Protocol::https" => :perl
  depends_on "go" => :build

  def install
    doc.install "README"
    libexec.install "setup.sh", "setup-deps.pl"
    system "go", "build", "xtract.go"
    rm ["Mozilla-CA.tar.gz", "xtract.go"]
    bin.install Dir["*"]
  end

  test do
    system bin/"esearch", "-version"
  end
end
