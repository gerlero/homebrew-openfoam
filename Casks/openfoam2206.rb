cask "openfoam2206" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.0"
  sha256 arm:   "0b7cf91e98fa3bb2fca4f75d12f7cdcefd5386e7f2677a35659ff756af931757",
         intel: "c15afd33c1a679cc080ccaa7115b35a4fef335ff09cfaf1ef7de5f661c54553e"

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
