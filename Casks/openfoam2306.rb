cask "openfoam2306" do
  arch arm: "arm64", intel: "x86_64"

  version "1.11.0"
  sha256 arm:   "9a029d5ce261aa420d15b66ee4ae5a50b355ad9c6d78ea820397bc5ec9c03f1c",
         intel: "479b56ce7e80e1194c0290e8bb93e727ab4d248df62674496f8e94ca02d82b10"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2306-app-#{arch}.zip"
  name "OpenFOAM v2306"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam"

  app "OpenFOAM-v2306.app"
  binary "#{appdir}/OpenFOAM-v2306.app/Contents/Resources/etc/openfoam", target: "openfoam2306"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2306.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
