cask "openfoam2306" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.1"
  sha256 arm:   "f624ffe746bf301739482b85346106ed0af4135601283992d1271cd9890b7177",
         intel: "efaea0da4bc93f7fb13bfeba833d99b0e37b45d1294124ea3b46d6f006ffbe9d"

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
