cask "openfoam2206" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.1"
  sha256 arm:   "1258df22de8713dc234f06489b49a427d1d143fc56859d60faf22812768e9b35",
         intel: "0eae7f117240ec97d1ab807e11561b418ffbd59346bfd48d6bce2dea53e995d0"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2206-app-#{arch}.zip"
  name "OpenFOAM v2206"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2206.app"
  binary "#{appdir}/OpenFOAM-v2206.app/Contents/Resources/etc/openfoam", target: "openfoam2206"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2206.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }

  caveats <<~EOS
    As of #{token} 1.10.0, the app is fully self-contained.
    If you are upgrading from a previous release, consider running:
      brew autoremove
    to uninstall Homebrew dependencies that are no longer required.
  EOS
end
