cask "openfoam@2512" do
  version "2.3.0"
  sha256 "a201c6b599a1071323b8c28a0b8a5a72311d24f2fc8c0c362cab246c7e302432"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2512-app.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "OpenFOAM-v2512.app"
  binary "#{appdir}/OpenFOAM-v2512.app/Contents/Resources/etc/openfoam", target: "openfoam2512"
  binary "#{appdir}/OpenFOAM-v2512.app/Contents/Resources/etc/openfoam", target: "openfoam"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "{{appdir}}/OpenFOAM-v2512.app"]
  end

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2512.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
