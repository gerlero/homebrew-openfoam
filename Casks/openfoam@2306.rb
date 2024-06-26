cask "openfoam@2306" do
  arch arm: "arm64", intel: "x86_64"

  version "1.13.1"
  sha256 arm:   "d7f74da0b7e3c777f9a09c1508c0ab8e0ed97b74ef7ba3ee4bcae36909bf8d35",
         intel: "479c6d3427115f8a0a493af15a504be478cad58354e3a53bd301dccf8dd092b7"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2306-app-#{arch}.zip"
  name "OpenFOAM v2306"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  deprecate! date: "2024-06-26", because: :discontinued

  app "OpenFOAM-v2306.app"
  binary "#{appdir}/OpenFOAM-v2306.app/Contents/Resources/etc/openfoam", target: "openfoam2306"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2306.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
