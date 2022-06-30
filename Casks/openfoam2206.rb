cask "openfoam2206" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.6.1"

  if Hardware::CPU.intel?
    sha256 "0677c75d5cb97dbfb816aa674b4e00f6748fe43947827525b75ede7a82c288b7"
  else
    sha256 "0e662f6f066de924a58cd2404a6139a6f70e09531f26cdb9d3d3d14ba845b5b7"
  end

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2206-app-#{arch}.zip"
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
