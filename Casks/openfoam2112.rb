cask "openfoam2112" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.8.0"

  if Hardware::CPU.intel?
    sha256 "e7af54dc1f359fc076f5484b5733a4a3e0d5da87108ee005ea8015978af3942f"
  else
    sha256 "7e42da639548dceacf7bbb36e2c010c5608070ac0e0de464ea3a35bc7a94b70a"
  end

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
  binary "#{appdir}/OpenFOAM-v2112.app/Contents/MacOS/openfoam", target: "openfoam2112"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2112.app/Contents/MacOS/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
