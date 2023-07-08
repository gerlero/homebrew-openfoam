cask "openfoam2112" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.2"
  sha256 arm:   "43b7d628b2f9bb98e8687cd3ae0888234d5561beccb55cbe855b778802a726a2",
         intel: "eeeb3cb816e817efb98f24ee9700b22a7b3839327476a247991f3ea0c35ac3ea"

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
end
