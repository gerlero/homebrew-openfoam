cask "openfoam@2506" do
  arch arm: "arm64", intel: "x86_64"

  on_arm do
    version "2.1.3"
    sha256 "fc1450f19a6615d85061856062fd76a9d880f9000a0768a4d819834489e13878"
  end
  on_intel do
    version "2.1.2"
    sha256 "7cbee661ad4cf09e4cf9e45cbdd69a9b21c1415c01c86c81207c28b70d31bcdc"
  end

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2506-app-#{arch}.zip"
  name "OpenFOAM v2506"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2506.app"
  binary "#{appdir}/OpenFOAM-v2506.app/Contents/Resources/etc/openfoam", target: "openfoam2506"

  postflight do
    system_command "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "#{appdir}/OpenFOAM-v2506.app"]
  end

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2506.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
