cask "openfoam2312" do
  arch arm: "arm64", intel: "x86_64"

  version "1.13.0"
  sha256 arm:   "2abc62d761fd99bfc8b1b6253aa3fd8f85c1d43c6715acb030bacba1333e25fc",
         intel: "917769c77a31d816c27a7d5b809ecf2baf27fc6c647a4a02015b88f364335002"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2312-app-#{arch}.zip"
  name "OpenFOAM v2312"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam"

  app "OpenFOAM-v2312.app"
  binary "#{appdir}/OpenFOAM-v2312.app/Contents/Resources/etc/openfoam", target: "openfoam2312"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2312.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
