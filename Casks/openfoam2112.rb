cask "openfoam2112" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.5.3"

  if Hardware::CPU.intel?
    sha256 "c935c36f9cf4ef624cbf95daf2fb9a12eeeffd26fe35cb3c89918fb473d028bc"
  else
    sha256 "287c42d7795d1716c9f002e7863c86513f812bef059dd30013855f5763cdef55"
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
