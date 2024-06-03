cask "openfoam@2312" do
  arch arm: "arm64", intel: "x86_64"

  version "1.13.1"
  sha256 arm:   "1d4e0720641a5471c4f8fbc6bbbd465382f1d4ddb737f76755d47ddc09b3b4f7",
         intel: "62af275f6dd139d20370d4f655348f39d7e3183e854d3909799e81bd7a8e5b8b"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2312-app-#{arch}.zip"
  name "OpenFOAM v2312"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam"

  app "OpenFOAM-v2312.app"
  binary "#{appdir}/OpenFOAM-v2312.app/Contents/Resources/etc/openfoam", target: "openfoam2312"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2312.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
