cask "openfoam2212" do
  arch arm: "arm64", intel: "x86_64"

  version "1.9.0"
  sha256 arm:   "db75ffee0097617f26762c96f8f332ee0a1984c6683d18e1b85e76e64b59f079",
         intel: "9bc210ce6cc2c360390c75c48187f0fb6e349f9ef879271423490dd1bd57402a"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2212-app-homebrew-#{arch}.zip"
  name "OpenFOAM v2212"
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

  app "OpenFOAM-v2212.app"
  binary "#{appdir}/OpenFOAM-v2212.app/Contents/Resources/etc/openfoam", target: "openfoam2212"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2212.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
