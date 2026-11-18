cask "openfoam@2606" do
  version "2.3.0"
  sha256 "10fc647fe8438ba2b20539f0aade93556e69d825b50b57deb4dd9ac77c768d0e"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2606-app.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "gerlero/openfoam/openfoam"
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "OpenFOAM-v2606.app"
  binary "#{appdir}/OpenFOAM-v2606.app/Contents/Resources/etc/openfoam", target: "openfoam2606"
  binary "#{appdir}/OpenFOAM-v2606.app/Contents/Resources/etc/openfoam", target: "openfoam"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "{{appdir}}/OpenFOAM-v2606.app"]
  end

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2606.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
