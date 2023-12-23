cask "openfoam2306" do
  arch arm: "arm64", intel: "x86_64"

  version "1.12.0"
  sha256 arm:   "c603ec3cdb2681e62620277f5dec85e81e22cd0cfb7a8363e30d43c15743f004",
         intel: "44d9ff48c07aca3f34185dda5ef4a3523422e0525cf649e85e3505f71db4b4bd"

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
