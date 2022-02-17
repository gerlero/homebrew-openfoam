cask "openfoam2112" do
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"

  version "1.1.0"

  if Hardware::CPU.intel?
    sha256 "cc1d75b7d9ff6863fe1b84196f9e6cbf0af5abdfacbd4b62cb6639dfaaee21ae"
  else
    sha256 "19110c20f8e60f746cf4132dd02ca5fa5851fab1495658f7d5b5f92a26bab286"
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
  depends_on formula: "cmake"
  depends_on formula: "fftw"
  depends_on formula: "kahip"
  depends_on formula: "metis"
  depends_on formula: "scotch"

  app "OpenFOAM-v2112.app"
  binary "#{appdir}/OpenFOAM-v2112.app/Contents/MacOS/openfoam", target: "openfoam2112"
end
