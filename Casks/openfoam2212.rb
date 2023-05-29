cask "openfoam2212" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.0"
  sha256 arm:   "d50fffbea5bcec8bccca2eca4a91926b2e01dbabf299a73f99f81b41c7f2e02e",
         intel: "2fc579c6c15c90ae23653a3f310a043dae078d093b9ff3cb4a6b0957bd8b5fd8"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2212-app-#{arch}.zip"
  name "OpenFOAM v2212"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2212.app"
  binary "#{appdir}/OpenFOAM-v2212.app/Contents/Resources/etc/openfoam", target: "openfoam2212"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2212.app/Contents/Resources/volume",
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
