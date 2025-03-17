cask "openfoam@2412" do
  arch arm: "arm64", intel: "x86_64"

  version "2.1.0"
  sha256 arm:   "7e878797d5261f9bbcf8da0437b543448f992e137d36b1321a233746db291a97",
         intel: "206731881ab08e074d49c4680978c14068c19da80d8705a6289e2b777578d851"

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
