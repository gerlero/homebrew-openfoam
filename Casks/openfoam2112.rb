cask "openfoam2112" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.6.0"

  if Hardware::CPU.intel?
    sha256 "8a0c0230248f7fda0787715e203bee0617be8268de2b4a210f5ae559af57a1b0"
  else
    sha256 "bbf886b37eebd1d1e18635d45b979f6cdb6787d1b0082666185c360605c1e001"
  end

  url "https://github.com/gerlero/openfoam2112-app/releases/download/v#{version}/openfoam2112-app-#{arch}.zip"
  name "OpenFOAM v2112"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam2112-app/"

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
    executable:   "hdiutil",
    args:         ["detach", "-quiet", "/Volumes/OpenFOAM-v2112"],
    must_succeed: false,
  }
end
