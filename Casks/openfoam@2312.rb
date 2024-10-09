cask "openfoam@2312" do
  arch arm: "arm64", intel: "x86_64"

  version "1.14.0"
  sha256 arm:   "09e41571ed8e228a6fc003d2548cd1d69b3b4c0eed5262406474caa54113051c",
         intel: "6ec54f1ef20fdbc9a7a74bfda6304c8cf40a410d1fd8f71f2dc9bc624221a175"

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
