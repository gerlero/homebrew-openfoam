cask "openfoam2206" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.7.0"

  if Hardware::CPU.intel?
    sha256 "3ce343f14a83f9c17e61b12db3da0280c4eced1ed6d32f31eeacfd9af32ea0c5"
  else
    sha256 "fd9ca955824a784f5d2cbf16ffcd6535f311a3e953c769e4932c53f8f8516220"
  end

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
  binary "#{appdir}/OpenFOAM-v2206.app/Contents/MacOS/openfoam", target: "openfoam2206"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2206.app/Contents/MacOS/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
