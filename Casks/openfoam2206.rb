cask "openfoam2206" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.2"
  sha256 arm:   "ae2f37ecbc0958f00ee34f7a5af94b3d28b8fe2cdf5296f2a705e4dba6a36bef",
         intel: "4eb19939426562a24a4b4be398b911a47fc22fac81de17ba378c0f8c7ba803ca"

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
