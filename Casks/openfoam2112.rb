cask "openfoam2112" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.5.4"

  if Hardware::CPU.intel?
    sha256 "5e87350b34bd171fcb12d8d09430323172c11ec76568dba3b61bec652c3d192d"
  else
    sha256 "5bff043e8b282b659ab8d9bccfcc3e21dff491a146256f8e30901002a490846f"
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
