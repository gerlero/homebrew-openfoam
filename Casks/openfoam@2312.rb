cask "openfoam@2312" do
  arch arm: "arm64", intel: "x86_64"

  version "2.0.0"
  sha256 arm:   "74b42f48ba283229921dc595fdeda89dda9d9d7e6a7be4201db29580eba0de33",
         intel: "aec86c16392b238ffcce69dbbccd0a20b0c73d82774dd7a343d41e411b11858b"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2312-app-#{arch}.zip"
  name "OpenFOAM v2312"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2312.app"
  binary "#{appdir}/OpenFOAM-v2312.app/Contents/Resources/etc/openfoam", target: "openfoam2312"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2312.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
