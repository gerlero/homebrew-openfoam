cask "openfoam2306" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.2"
  sha256 arm:   "3d70f32d2efb4e8c8ab7bbec91920ceb087d923ff2e01780cf1bee720254e1c2",
         intel: "da0efdfc04b3a202d6e53f877613b9ca5af000f020cabe24f4d4b0ac51abb182"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2306-app-#{arch}.zip"
  name "OpenFOAM v2306"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "OpenFOAM-v2306.app"
  binary "#{appdir}/OpenFOAM-v2306.app/Contents/Resources/etc/openfoam", target: "openfoam2306"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2306.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
