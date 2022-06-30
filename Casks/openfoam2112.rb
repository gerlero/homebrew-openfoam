cask "openfoam2112" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.6.1"

  if Hardware::CPU.intel?
    sha256 "856a2e11478238973ae4531343ec4c8eee0b3c1c59e02dd51d21d8bd595e57d2"
  else
    sha256 "ef9ec7150a3026c84c8f2792968dd07344e273efc6353193c5d09cd7e9f29a9a"
  end

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2112-app-#{arch}.zip"
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
