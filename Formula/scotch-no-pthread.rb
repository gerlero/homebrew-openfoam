class ScotchNoPthread < Formula
  desc "Package for graph partitioning, graph clustering, and sparse matrix ordering"
  homepage "https://gitlab.inria.fr/scotch/scotch"
  url "https://gitlab.inria.fr/scotch/scotch/-/archive/v6.1.3/scotch-v6.1.3.tar.bz2"
  sha256 "99f2044b2eca8b2fbf7199dd222748bc4e70a3e65b382b3a067a51194f119fb2"
  license "CECILL-C"
  head "https://gitlab.inria.fr/scotch/scotch.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/gerlero/homebrew-openfoam/releases/download/scotch-no-pthread-6.1.3"
    rebuild 3
    sha256 cellar: :any,                 arm64_sonoma: "41d7b5a1a34d16003e2d64f46b0833b3a368e5664d2555c92fd1b2717ffc0f80"
    sha256 cellar: :any,                 ventura:      "c90266d5e3614969e13159ada9b42fd06e417e731be0842bbed901f99efd4c4a"
    sha256 cellar: :any,                 monterey:     "24adc9e4e6880e5a94e3a44b6403b616389902c26000b1575bdabf3584b697e4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "61310fff5336a5c11ad2427318fba7d1c220e2fea6ac4db71f4527bab284dbec"
  end

  keg_only "it conflicts with the `scotch` formula from core"

  deprecate! date: "2024-02-23", because: "is no longer needed for OpenFOAM"

  depends_on "open-mpi"

  uses_from_macos "bison"
  uses_from_macos "flex"
  uses_from_macos "zlib"

  def install
    cd "src" do
      (buildpath/"src").install_symlink "Make.inc/Makefile.inc.i686_mac_darwin10" => "Makefile.inc"
      inreplace "Makefile.inc" do |s|
        s.change_make_var! "CCS", ENV.cc
        s.change_make_var! "CCP", "mpicc"
        s.change_make_var! "CCD", "mpicc"
        # Remove -DSCOTCH_PTHREAD flag for compatibility with OpenFOAM (note: -DSCOTCH_PTHREAD_MPI in scotch >= 7)
        s.gsub! "-DSCOTCH_PTHREAD", ""
      end

      system "make", "scotch", "ptscotch"
      system "make", "prefix=#{prefix}", "install"

      pkgshare.install "check/test_strat_seq.c"
      pkgshare.install "check/test_strat_par.c"
    end
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <stdlib.h>
      #include <stdio.h>
      #include <scotch.h>
      int main(void) {
        int major, minor, patch;
        SCOTCH_version(&major, &minor, &patch);
        printf("%d.%d.%d", major, minor, patch);
        return 0;
      }
    EOS
    system ENV.cc, "test.c", "-I#{include}", "-L#{lib}", "-lscotch"
    assert_match version.to_s, shell_output("./a.out")

    system ENV.cc, pkgshare/"test_strat_seq.c", "-o", "test_strat_seq",
           "-I#{include}", "-L#{lib}", "-lscotch", "-lscotcherr", "-lm", "-pthread"
    assert_match "Sequential mapping strategy, SCOTCH_STRATDEFAULT", shell_output("./test_strat_seq")

    system "mpicc", pkgshare/"test_strat_par.c", "-o", "test_strat_par",
           "-I#{include}", "-L#{lib}", "-lptscotch", "-lscotch", "-lptscotcherr", "-lm", "-pthread"
    assert_match "Parallel mapping strategy, SCOTCH_STRATDEFAULT", shell_output("./test_strat_par")
  end
end
