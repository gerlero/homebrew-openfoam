cask "openfoam2206" do
  arch arm: "arm64", intel: "x86_64"

  version "1.8.7"
  sha256 arm:   "2c1a726bbbf588a44ec7b8f044eca469a6c7e15af7f8860ef53bb37322a1c725",
         intel: "f486e4a3e39520c3f0765f6429a603d1f3ea96344336b7a17f112e0301174af9"

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
