cask "openfoam2112" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.0"
  sha256 arm:   "32ebc7b23f9eeebd00a99d58be5fe6db23927d81f914b3f7d96302d06672a5d7",
         intel: "06692a1d3a7877469e5e388a5a31fd3275af6da9d976cd47a667c795773d75e1"

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
