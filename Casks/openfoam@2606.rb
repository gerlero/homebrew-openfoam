cask "openfoam@2606" do
  version "2.2.1"
  sha256 "b0b297a4ba21de889ad6abc62a8c4f93b1ed9a0b3bcf8484c28bb38c9c2e0c50"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2606-app-arm64.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "gerlero/openfoam/openfoam"
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
