cask "openfoam@2406" do
  arch arm: "arm64", intel: "x86_64"

  version "2.0.0"
  sha256 arm:   "5ecb5d8bf707e4ef5c132952217a49f6c8ae989e72fbc71592abaf66d309298a",
         intel: "25beebeda6f9905c435dc0ec16271a3b586d97d4d36de0200e1c09e48867945f"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2406-app-#{arch}.zip"
  name "OpenFOAM v2406"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam"

  app "OpenFOAM-v2406.app"
  binary "#{appdir}/OpenFOAM-v2406.app/Contents/Resources/etc/openfoam", target: "openfoam2406"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2406.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
