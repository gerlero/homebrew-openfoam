cask "openfoam2206" do
  arch arm: "arm64", intel: "x86_64"

  version "1.8.5"
  sha256 arm:   "aa7a53fcf92700fc2cc6da423ea895bce54d667d688d011b81d17b8a059f6b38",
         intel: "b598733d640a88a722ecbb72933ea08d3ebecec1d3ae2ba9db7c651f15a343e8"

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
