cask "openfoam@2412" do
  arch arm: "arm64", intel: "x86_64"

  version "2.1.1"
  sha256 arm:   "77e7f640eebb290eb13e658779d034d6bf8813c1b58c0577e54164dd7ef50acd",
         intel: "682ab2087d56e09a85501abe36654a4a627b089f1bb6b0d244e83466eef179de"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2412-app-#{arch}.zip"
  name "OpenFOAM v2412"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2412.app"
  binary "#{appdir}/OpenFOAM-v2412.app/Contents/Resources/etc/openfoam", target: "openfoam2412"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2412.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
