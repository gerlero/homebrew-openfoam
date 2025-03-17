cask "openfoam@2406" do
  arch arm: "arm64", intel: "x86_64"

  version "2.1.0"
  sha256 arm:   "b36d0edaf76a62ee9ff04ccc7e9947dc07cd6b8adc3e09c24fd786965750ee80",
         intel: "0bb9321480e6532c565e75d9ac5e8a53575963ed4aa9963debb5b9289812b48e"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2406-app-#{arch}.zip"
  name "OpenFOAM v2406"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2406.app"
  binary "#{appdir}/OpenFOAM-v2406.app/Contents/Resources/etc/openfoam", target: "openfoam2406"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2406.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
