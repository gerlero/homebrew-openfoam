cask "openfoam@2406" do
  arch arm: "arm64", intel: "x86_64"

  version "1.13.2"
  sha256 arm:   "68746f45d22cb2b1ca9e7309383f13a4443b962b330c2ccce6a0808ec146625b",
         intel: "787e2fdb2bb5556dce8e9f736d33d2cf224efc5bd52c12616615de3317d930ee"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2406-app-#{arch}.zip"
  name "OpenFOAM v2406"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "openfoam"

  app "OpenFOAM-v2406.app"
  binary "#{appdir}/OpenFOAM-v2406.app/Contents/Resources/etc/openfoam", target: "openfoam2406"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2406.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end
