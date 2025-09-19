cask "openfoam@2506" do
  arch arm: "arm64", intel: "x86_64"

  version "2.1.2"
  sha256 arm:   "eda53b21d02ee28068c8be7f2cea62568fc105c02d90aeb05311341019dfb699",
         intel: "7cbee661ad4cf09e4cf9e45cbdd69a9b21c1415c01c86c81207c28b70d31bcdc"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2506-app-#{arch}.zip"
  name "OpenFOAM v2506"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam"

  app "OpenFOAM-v2506.app"
  binary "#{appdir}/OpenFOAM-v2506.app/Contents/Resources/etc/openfoam", target: "openfoam2506"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2506.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
