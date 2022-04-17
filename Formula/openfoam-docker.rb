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

  bottle do
    root_url "https://github.com/gerlero/homebrew-openfoam/releases/download/openfoam-docker-2022-01-10"
    sha256 cellar: :any_skip_relocation, big_sur:      "e746c7d6e54f85248fa7ab918fbc878fe85ba0cdbf48075e0b7e50275b4c27ce"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "16504f5259a444c66ae4a0e3740db482a0f29f36d255a719e4ff2a89de43a55f"
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
