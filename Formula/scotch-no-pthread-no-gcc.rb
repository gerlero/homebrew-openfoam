class ScotchNoPthreadNoGcc < Formula
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
  
    keg_only "this is a variant of the default 'scotch' formula"
  
    depends_on :macos
    depends_on "gerlero/openfoam/open-mpi-no-gcc"
  
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
  