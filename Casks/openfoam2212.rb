cask "openfoam2212" do
  arch arm: "arm64", intel: "x86_64"

  version "1.8.7"
  sha256 arm:   "4e4144050e7ccd88f8d36f63817daa549c327bcdbe485a53e6db13bc52027a0e",
         intel: "1e19001a49c162a78a0d4747cb23cc8a7ce571867731d11c0247ef5719c8782b"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2212-app-homebrew-#{arch}.zip"
  name "OpenFOAM v2212"
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

  app "OpenFOAM-v2212.app"
  binary "#{appdir}/OpenFOAM-v2212.app/Contents/Resources/etc/openfoam", target: "openfoam2212"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2212.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
