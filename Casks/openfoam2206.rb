cask "openfoam2206" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.7.1"

  if Hardware::CPU.intel?
    sha256 "fc4cef141dfef11f1eb319df8fab92a9c86ebff4bd778ad2e9df309f9bb0a9b3"
  else
    sha256 "353c59508c4f73e7839f183538c2a716c0dda593cd54e08f68430193f35178c6"
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
