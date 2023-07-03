cask "openfoam2112" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.1"
  sha256 arm:   "296c539380a42c472a6cc80e92effb84b15f326e7ed145ace2bb34b1c3734aa6",
         intel: "47e3aec8358b63c7d7e757271d637b2da5a6c4a9609ca110c4b878053c2e5a42"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2112-app-#{arch}.zip"
  name "OpenFOAM v2112"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2112.app"
  binary "#{appdir}/OpenFOAM-v2112.app/Contents/Resources/etc/openfoam", target: "openfoam2112"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2112.app/Contents/Resources/volume",
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
