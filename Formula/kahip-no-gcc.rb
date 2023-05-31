class KahipNoGcc < Formula
  desc "Karlsruhe High Quality Partitioning"
  homepage "https://algo2.iti.kit.edu/documents/kahip/index.html"
  url "https://github.com/KaHIP/KaHIP/archive/v3.15.tar.gz"
  sha256 "20760099370ddf7ecb2f92bfdb727def48f6428001165be6ce504264b9a99a0b"
  license "MIT"
  head "https://github.com/KaHIP/KaHIP.git", branch: "master"

  keg_only "it conflicts with `kahip`"

  depends_on "cmake" => :build
  depends_on "gerlero/openfoam/open-mpi-no-gcc"

  on_macos do
    depends_on "libomp"
  end

  fails_with :clang do
    cause "needs OpenMP support"
  end

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    output = shell_output("#{bin}/interface_test")
    assert_match "edge cut 2", output
  end
end
