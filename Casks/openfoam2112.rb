cask "openfoam2112" do
  arch arm: "arm64", intel: "x86_64"

  version "1.8.5"
  sha256 arm:   "e89259365bfe793fc12fce4fdd620a8eede65ae6acdb1181ff0797dc59499c89",
         intel: "12b8c66dea676f8729294f4087ab15ae1b6b6cb752b7b5bb7a4e774f68428400"

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
  binary "#{appdir}/OpenFOAM-v2112.app/Contents/Resources/etc/openfoam", target: "openfoam2112"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2112.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
