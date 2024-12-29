cask "openfoam@2412" do
  arch arm: "arm64", intel: "x86_64"

  version "2.0.1"
  sha256 arm:   "a45678d0673412d291e844f1f364377f227b0c105fa9ed5b56a895dd4bd069fa",
         intel: "1a8e5202b137fbf857862eb794788a99a5caec86f8cc12b35d522e98647f3d00"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2412-app-#{arch}.zip"
  name "OpenFOAM v2412"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam"

  app "OpenFOAM-v2412.app"
  binary "#{appdir}/OpenFOAM-v2412.app/Contents/Resources/etc/openfoam", target: "openfoam2412"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2412.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
