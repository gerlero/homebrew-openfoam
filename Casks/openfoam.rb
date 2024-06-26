cask "openfoam" do
  arch arm: "arm64", intel: "x86_64"

  version "1.13.2"
  sha256 arm:   "02e863d6b077eff4fe539b63e2131a3c9ff2b3639e07e252def0624a86f38e6f",
         intel: "c5cbd0f4402c2593f326373b9be5a5ec5a4edef08df299f4fb564fb1079f293d"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2406-app-#{arch}.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam@2406"

  app "OpenFOAM-v2406.app"
  binary "#{appdir}/OpenFOAM-v2406.app/Contents/Resources/etc/openfoam", target: "openfoam2406"
  binary "#{appdir}/OpenFOAM-v2406.app/Contents/Resources/etc/openfoam", target: "openfoam"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2406.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
