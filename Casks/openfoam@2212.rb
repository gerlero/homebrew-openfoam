cask "openfoam@2212" do
  arch arm: "arm64", intel: "x86_64"

  version "1.11.1"
  sha256 arm:   "0317b1e8a34667a31ee601391500670c1778a3955e684e65cdffd4632580512e",
         intel: "99e7caa6b3c497f872fa9896dba74cae427c1fe7eaa363b93384239ba8461b90"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2212-app-#{arch}.zip"
  name "OpenFOAM v2212"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  deprecate! date: "2023-12-23", because: :discontinued

  app "OpenFOAM-v2212.app"
  binary "#{appdir}/OpenFOAM-v2212.app/Contents/Resources/etc/openfoam", target: "openfoam2212"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2212.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
