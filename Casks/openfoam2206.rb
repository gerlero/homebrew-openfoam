cask "openfoam2206" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.8.0"

  if Hardware::CPU.intel?
    sha256 "a93efad45a2847fd53a732bc9ec4e64b7d2788dbe7a5071bfa1093756f7d3d1d"
  else
    sha256 "b13ddf35cdcee45306be567ba5121aad6470d8beea1a5d7148f93dfaa418a5a3"
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
