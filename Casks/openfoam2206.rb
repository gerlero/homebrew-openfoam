cask "openfoam2206" do
  arch = on_intel do
    "x86_64"
  end
  on_arm do
    "arm64"
  end

  version "1.8.1"
  sha256 arm:   "9845348363c1ce1a962bb382a1ae748891f4ebd169f6e764c06f69ec062d7df5",
         intel: "96db51c3fdb35774b5925585d1a7850e9f2118011576668a0cd565a0bb7b7be8"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2206-app-homebrew-#{arch}.zip"
  name "OpenFOAM v2206"
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

  app "OpenFOAM-v2206.app"
  binary "#{appdir}/OpenFOAM-v2206.app/Contents/Resources/etc/openfoam", target: "openfoam2206"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2206.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
