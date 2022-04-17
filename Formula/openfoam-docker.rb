class OpenfoamDocker < Formula
  desc "Run script for OpenFOAM container images"
  homepage "https://develop.openfoam.com/packaging/containers/"
  url "https://develop.openfoam.com/packaging/containers/-/raw/a69dc0f03a123b58291c828e1d255dfbeb917180/openfoam-docker"
  version "2022-01-10"
  sha256 "b48fab16bfaa9fa408553ae672fc9781acc8f85276784f7de1239fe47f647677"
  license "GPL-3.0-or-later"
  head "https://develop.openfoam.com/packaging/containers/-/raw/main/openfoam-docker"

  livecheck do
    url :head
    regex(/scriptVersion="?(\d+(-\d+)+)"?/i)
  end

  def install
    bin.install "openfoam-docker"
  end

  def caveats
    <<~EOS
      openfoam-docker uses Docker (or Podman)
      To install Docker Desktop, run:
        brew install --cask docker
    EOS
  end

  test do
    system bin/"openfoam-docker", "-help"
  end
end
