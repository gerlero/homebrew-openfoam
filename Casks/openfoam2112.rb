cask "openfoam2112" do
  arch arm: "arm64", intel: "x86_64"

  version "1.8.6"
  sha256 arm:   "6f6a87ab248bb238b6e64fce9c26d399d8348be9af280d8c2bd82124255ac548",
         intel: "1417718024d790d1a162e276a5eeeafcb55aa9b65514b6d8af0044227603fec3"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2112-app-homebrew-#{arch}.zip"
  name "OpenFOAM v2112"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "bash"
  depends_on formula: "open-mpi"
  depends_on formula: "libomp"
  depends_on formula: "adios2"
  depends_on formula: "boost"
  depends_on formula: "fftw"
  depends_on formula: "kahip"
  depends_on formula: "metis"
  depends_on formula: "gerlero/openfoam/cgal@4"
  depends_on formula: "gerlero/openfoam/scotch-no-pthread"

  app "OpenFOAM-v2112.app"
  binary "#{appdir}/OpenFOAM-v2112.app/Contents/Resources/etc/openfoam", target: "openfoam2112"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2112.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
