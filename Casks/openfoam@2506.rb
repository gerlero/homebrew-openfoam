cask "openfoam@2506" do
  arch arm: "arm64", intel: "x86_64"

  version "2.1.0"
  sha256 arm:   "948bbefa31f77aecf157086c35d47a741a4dc8f19b73bf8295bf32c559a27da5",
         intel: "df4dccf576ac213aa7ea5dd726b59c777eafdc519ea041a34bc04812933a4445"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2506-app-#{arch}.zip"
  name "OpenFOAM v2506"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam"

  app "OpenFOAM-v2506.app"
  binary "#{appdir}/OpenFOAM-v2506.app/Contents/Resources/etc/openfoam", target: "openfoam2506"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2506.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
