cask "openfoam2112" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.0.2"

  if Hardware::CPU.intel?
    sha256 "07a63b3d05068d4c943cf9c63f5f9cf9c20ec8a8b713702ccf30b3745c05ea78"
  else
    sha256 "1c7a30b514f3871c374dd8dc89bdbc5b59bf4b30bc51e74abe99e4b1d509c856"
  end

  url "https://github.com/gerlero/openfoam2112-app/releases/download/v#{version}/openfoam2112-app-#{arch}.zip"
  name "OpenFOAM v2112"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam2112-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "open-mpi"
  depends_on formula: "libomp"
  depends_on formula: "adios2"
  depends_on formula: "boost"
  depends_on formula: "cmake"
  depends_on formula: "fftw"
  depends_on formula: "kahip"
  depends_on formula: "metis"
  depends_on formula: "scotch"

  app "OpenFOAM-v2112.app"
  binary "#{appdir}/OpenFOAM-v2112.app/Contents/MacOS/openfoam", target: "openfoam2112"
end
