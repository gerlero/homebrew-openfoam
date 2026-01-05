cask "openfoam@2506" do
  version "2.1.3"
  sha256 "fc1450f19a6615d85061856062fd76a9d880f9000a0768a4d819834489e13878"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2506-app-arm64.zip"
  name "OpenFOAM v2506"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "OpenFOAM-v2506.app"
  binary "#{appdir}/OpenFOAM-v2506.app/Contents/Resources/etc/openfoam", target: "openfoam2506"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2506.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
