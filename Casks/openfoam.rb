cask "openfoam" do
  arch arm: "arm64", intel: "x86_64"

  version "1.12.1"
  sha256 arm:   "030573a3baa93929c22cdbb4f1b8e9f1bdf2f2429b101c0f8831d14ff0f6e1c0",
         intel: "7e30fce23f686fd3a5b4b377a0ca61c8a9fec30a0f6cf63bdd43cd087d6b9914"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2312-app-#{arch}.zip"
  name "OpenFOAM"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam2312"

  app "OpenFOAM-v2312.app"
  binary "#{appdir}/OpenFOAM-v2312.app/Contents/Resources/etc/openfoam", target: "openfoam2312"
  binary "#{appdir}/OpenFOAM-v2312.app/Contents/Resources/etc/openfoam", target: "openfoam"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2312.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
