cask "openfoam@2406" do
  arch arm: "arm64", intel: "x86_64"

  version "2.0.1"
  sha256 arm:   "6a1fdbfdda724dbcf40071f15a57d16665370e91aed6d4c6da30950a8dd0d9b8",
         intel: "9be5d34d999f8eae13ab1eadcee057edfea72d587eae9d484f6a3a33ba87b0b4"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2406-app-#{arch}.zip"
  name "OpenFOAM v2406"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2406.app"
  binary "#{appdir}/OpenFOAM-v2406.app/Contents/Resources/etc/openfoam", target: "openfoam2406"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2406.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
