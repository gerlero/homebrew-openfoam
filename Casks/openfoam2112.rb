cask "openfoam2112" do
  arch arm: "arm64", intel: "x86_64"

  version "1.9.0"
  sha256 arm:   "fbbdff20450bdd18a7ee3078a361afd42be424ac97a4e5cfb49c32a2f1e33e8a",
         intel: "88925bce32017609305b02a69291b8f86f56db5b110fb70763d3d90380f897dd"

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
  depends_on formula: "boost"
  depends_on formula: "fftw"
  depends_on formula: "kahip"
  depends_on formula: "metis"
  depends_on formula: "gerlero/openfoam/cgal@4"
  depends_on formula: "gerlero/openfoam/scotch-no-pthread"

  app "OpenFOAM-v2112.app"
  binary "#{appdir}/OpenFOAM-v2112.app/Contents/Resources/etc/openfoam", target: "openfoam2112"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2112.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
