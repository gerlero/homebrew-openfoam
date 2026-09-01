cask "openfoam" do
  version "2.2.2"
  sha256 "5976d82f905335dc7229ee8220cb5128d662f05f70af5cfac6a3681b74d6880d"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2606-app-arm64.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "gerlero/openfoam/openfoam@2606"
  depends_on arch: :arm64
  depends_on macos: :sonoma

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
