cask "openfoam2306" do
  arch arm: "arm64", intel: "x86_64"

  version "1.13.0"
  sha256 arm:   "b779b83e19da0081d7d19986ca38b34fa24cca527288fbd58441a5c0e9505ede",
         intel: "f131ee86e6cb4daf3d1cbb6e2301ee8d6b2d8c7e234a007612589c4c6e25b78f"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2306-app-#{arch}.zip"
  name "OpenFOAM v2306"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2306.app"
  binary "#{appdir}/OpenFOAM-v2306.app/Contents/Resources/etc/openfoam", target: "openfoam2306"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2306.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
