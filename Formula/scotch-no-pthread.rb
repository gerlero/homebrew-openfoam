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
    sha256 cellar: :any,                 arm64_monterey: "91f03cb1007abbf67a644e735fe443e4169398c3695ba64dff5ecfd4847a5b31"
    sha256 cellar: :any,                 arm64_big_sur:  "503025cb4b3f0d8db315970a30e4ffe30199913b30ff036aa73624d2201d0907"
    sha256 cellar: :any,                 monterey:       "ea1a22d651955876079f3c3b15e27359417dd32da4aaa08a31a9d0b8cd475849"
    sha256 cellar: :any,                 big_sur:        "c0c83373c6fcbe49f01ba2cd8e73ff767671f0e43d00cd666c9005a9286059a0"
    sha256 cellar: :any,                 catalina:       "8ef12d89d6d2de7ff4495456cb23f5dc89770c834a4d35b604d8ecdd6115c448"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "085ce19d188ae760959d428a7da362de763e74d4d83efc598cef3cb2772df291"
  end

  keg_only "this is a variant of the default 'scotch' formula"

  depends_on :macos
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
