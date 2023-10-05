cask "openfoam2212" do
  arch arm: "arm64", intel: "x86_64"

  version "1.11.0"
  sha256 arm:   "3b467b0f66badb92e4ee758aa4e84949494105143ab09bbe0aa07f5d2813e4c1",
         intel: "7f2714dbf310965035a14f106e517a8ad0a7545d301298d22a19feb197eeed12"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2212-app-#{arch}.zip"
  name "OpenFOAM v2212"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2212.app"
  binary "#{appdir}/OpenFOAM-v2212.app/Contents/Resources/etc/openfoam", target: "openfoam2212"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2212.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
