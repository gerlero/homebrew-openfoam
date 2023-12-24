cask "openfoam2306" do
  arch arm: "arm64", intel: "x86_64"

  version "1.12.1"
  sha256 arm:   "00a7c31fa6a095335766a2af2a5e8015329e66669a5a04a26e8055dc2a6c2d25",
         intel: "8dc279f7936a21fa52249602565b00c1622752703b2e3d45c02f23853c45b6e6"

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
