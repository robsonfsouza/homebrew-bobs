class GoCloudmonkey < Formula
  desc "Apache CloudStack CloudMonkey command line interface (Go version)"
  homepage "https://github.com/apache/cloudstack-cloudmonkey"
  license "Apache License 2.0"
  head "https://github.com/apache/cloudstack-cloudmonkey.git", branch: "main"

  depends_on "go" => :build

  def install
    system "make", "all"
    bin.install Dir.glob("bin/*")
  end
end
