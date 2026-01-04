cask "openfoam@2412" do
  arch arm: "arm64", intel: "x86_64"

  version "2.1.2"
  sha256 arm:   "0611ebfaf09c2585fd58d6363b986b9d762f7ebd6cd544b36eadb6ffd8b5683d",
         intel: "4059d8d2cf3620947a4c10838a9f79958185483ac1a54fe4f0b336457961abc5"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2412-app-#{arch}.zip"
  name "OpenFOAM v2412"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  deprecate! date: "2026-01-04", because: :discontinued

  app "OpenFOAM-v2412.app"
  binary "#{appdir}/OpenFOAM-v2412.app/Contents/Resources/etc/openfoam", target: "openfoam2412"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2412.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
