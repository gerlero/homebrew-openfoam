cask "openfoam@2512" do
  version "2.2.2"
  sha256 "b0a922a20a0ecd3a9ad203afb92758f94a5908f69fcea28a885bfe4178da0ad0"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2512-app-arm64.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "OpenFOAM-v2512.app"
  binary "#{appdir}/OpenFOAM-v2512.app/Contents/Resources/etc/openfoam", target: "openfoam2512"
  binary "#{appdir}/OpenFOAM-v2512.app/Contents/Resources/etc/openfoam", target: "openfoam"

  postflight do
    system_command "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "#{appdir}/OpenFOAM-v2512.app"]
  end

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2512.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
