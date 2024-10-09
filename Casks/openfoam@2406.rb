cask "openfoam@2406" do
  arch arm: "arm64", intel: "x86_64"

  version "1.14.0"
  sha256 arm:   "4c92f54ffefbc6c1de39c9d46c0b4138a9658f253e5e6f099e75986ba7703b17",
         intel: "998489edb6c52bcb4e7fc28352b3781100b457cea303825eda141e7cca40bf03"

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
