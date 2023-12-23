cask "openfoam" do
  arch arm: "arm64", intel: "x86_64"

  version "1.12.0"
  sha256 arm:   "5fec271cb9776372f8d4dc8f4e725cbea950bcea9d43c09c8489c54ed14a7893",
         intel: "2681c9e52ad1af6a5c4110f7499e07dd5c5276a1278849f6c2ee57e77a5c8829"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2312-app-#{arch}.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam2312"

  app "OpenFOAM-v2312.app"
  binary "#{appdir}/OpenFOAM-v2312.app/Contents/Resources/etc/openfoam", target: "openfoam2312"
  binary "#{appdir}/OpenFOAM-v2312.app/Contents/Resources/etc/openfoam", target: "openfoam"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2312.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
