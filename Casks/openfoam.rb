cask "openfoam" do
  version "2.2.0"
  sha256 "0b4cdea5a51ed75974f501d23be5450182cf37335428f37466bca745ca5f06f9"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2606-app-arm64.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam@2606"
  depends_on arch: :arm64
  depends_on :macos

  app "OpenFOAM-v2606.app"
  binary "#{appdir}/OpenFOAM-v2606.app/Contents/Resources/etc/openfoam", target: "openfoam2606"
  binary "#{appdir}/OpenFOAM-v2606.app/Contents/Resources/etc/openfoam", target: "openfoam"

  postflight do
    system_command "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "#{appdir}/OpenFOAM-v2606.app"]
  end

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2606.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
