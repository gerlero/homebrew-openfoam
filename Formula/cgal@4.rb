class CgalAT4 < Formula
  desc "Computational Geometry Algorithm Library"
  homepage "https://www.cgal.org/"
  url "https://github.com/CGAL/cgal/releases/download/releases%2FCGAL-4.14.3/CGAL-4.14.3.tar.xz"
  sha256 "5bafe7abe8435beca17a1082062d363368ec1e3f0d6581bb0da8b010fb389fe4"

  bottle do
    root_url "https://github.com/gerlero/homebrew-openfoam/releases/download/cgal@4-4.14.3"
    sha256 cellar: :any,                 monterey:     "7d00d0c7a1c1f74e519520b3de48a7c98ec6e127814951347b2faace45d8bfb9"
    sha256 cellar: :any,                 big_sur:      "5bf0a43960b562ed878d044329c342b133607034728ff2f49fe6ad6440c7d87e"
    sha256 cellar: :any,                 catalina:     "434893e9c7fde34d84097adaddd78dfb7b6f26b2ecb63ce80975b3675d006fcd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2df1d963d24f975e41c0838fd6992d66ec3700ca3a3d87cf9cb8ba6ac8096e4a"
  end

  keg_only :versioned_formula

  depends_on "cmake" => [:build, :test]
  depends_on "boost"
  depends_on "eigen"
  depends_on "gmp"
  depends_on "mpfr"

  def install
    args = std_cmake_args + %W[
      -DCMAKE_CXX_FLAGS='-std=c++14'
      -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON
      -DCMAKE_INSTALL_NAME_DIR=#{lib}
      -DWITH_Eigen3=ON
      -DWITH_LAPACK=ON
      -DWITH_CGAL_Qt5=OFF
      -DWITH_CGAL_ImageIO=OFF
    ]

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    # https://doc.cgal.org/latest/Algebraic_foundations/Algebraic_foundations_2interoperable_8cpp-example.html
    (testpath/"surprise.cpp").write <<~EOS
      #include <CGAL/basic.h>
      #include <CGAL/Coercion_traits.h>
      #include <CGAL/IO/io.h>
      template <typename A, typename B>
      typename CGAL::Coercion_traits<A,B>::Type
      binary_func(const A& a , const B& b){
          typedef CGAL::Coercion_traits<A,B> CT;
          CGAL_static_assertion((CT::Are_explicit_interoperable::value));
          typename CT::Cast cast;
          return cast(a)*cast(b);
      }
      int main(){
          std::cout<< binary_func(double(3), int(5)) << std::endl;
          std::cout<< binary_func(int(3), double(5)) << std::endl;
          return 0;
      }
    EOS
    (testpath/"CMakeLists.txt").write <<~EOS
      cmake_minimum_required(VERSION 3.1...3.13)
      find_package(CGAL)
      add_executable(surprise surprise.cpp)
      target_link_libraries(surprise PRIVATE CGAL::CGAL)
    EOS
    system "cmake", "-L", "-DCMAKE_BUILD_RPATH=#{lib}", "-DCMAKE_PREFIX_PATH=#{prefix}", "."
    system "cmake", "--build", ".", "-v"
    assert_equal "15\n15", shell_output("./surprise").chomp
  end
end
