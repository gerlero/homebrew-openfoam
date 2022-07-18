cask "openfoam2112" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.7.0"

  if Hardware::CPU.intel?
    sha256 "b7a936327007fe8a2edcdc3fe8967d54cbe4779ba2cdd895ba4de60465f9f939"
  else
    sha256 "4d0237c43ce97f5a2191f5ceac70e2e5b3f1974a2fabffd86fb28924cbd97199"
  end

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
  binary "#{appdir}/OpenFOAM-v2112.app/Contents/MacOS/openfoam", target: "openfoam2112"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2112.app/Contents/MacOS/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
