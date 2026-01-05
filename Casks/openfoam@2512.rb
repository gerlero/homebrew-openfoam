cask "openfoam@2512" do
  version "2.1.3"
  sha256 "22ffc888ba49fc6ab3c2207ad33e8044ebc0783edba638f31ecdefd434093d00"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2512-app-arm64.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam"
  depends_on arch: :arm64

  app "OpenFOAM-v2512.app"
  binary "#{appdir}/OpenFOAM-v2512.app/Contents/Resources/etc/openfoam", target: "openfoam2512"
  binary "#{appdir}/OpenFOAM-v2512.app/Contents/Resources/etc/openfoam", target: "openfoam"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2512.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
