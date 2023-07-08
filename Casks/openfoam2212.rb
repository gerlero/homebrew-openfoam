cask "openfoam2212" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.2"
  sha256 arm:   "d4b31a302843f8e75df271fa456787f5ab20ad11baeaee6b21b3e00b2170998a",
         intel: "acc9bf5cb0ec03af1541eff71b357299ab2f92c87fb67854481798bec9f7f92c"

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

    OpenFOAM-v2306.app is now available. To install it, run:
      brew install --no-quarantine openfoam2306
  EOS
end
