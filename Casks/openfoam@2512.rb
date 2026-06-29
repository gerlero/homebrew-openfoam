cask "openfoam@2512" do
  version "2.2.0"
  sha256 "66bd09af6d1425bbdf416dd1116454fef1c692ba721dedbb27aa43d04512ef9c"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2512-app-arm64.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

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
