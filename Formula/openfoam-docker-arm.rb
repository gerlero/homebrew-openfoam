class OpenfoamDockerArm < Formula
  desc "Run script for ARM-based OpenFOAM container images"
  homepage "https://github.com/gerlero/openfoam-docker-arm/"
  url "https://raw.githubusercontent.com/gerlero/openfoam-docker-arm/c88703d81b3a8c39bc19d3844c2927f2517250a4/openfoam-docker-arm"
  version "2021-12-21"
  sha256 "db44872ed03ebacee2d1ef47ffc33ee327251f51fb54f42769cb0242b2a0b3d7"
  license "GPL-3.0-or-later"
  head "https://raw.githubusercontent.com/gerlero/openfoam-docker-arm/main/openfoam-docker-arm"

  livecheck do
    url :head
    regex(/scriptVersion="?(\d+(-\d+)+)"?/i)
  end

  bottle do
    root_url "https://github.com/gerlero/homebrew-openfoam/releases/download/openfoam-docker-arm-2021-12-21"
    sha256 cellar: :any_skip_relocation, big_sur:      "380ab1adf2f633a211bfee1c39f1acb0a3e21ed54784f77f5def14366c8aca9f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a5c9649baff4d8ed82462394f0a25369b17d6b9148afc65c4e2a994a50ce84de"
  end

  def install
    bin.install "openfoam-docker-arm"
  end

  def caveats
    <<~EOS
      openfoam-docker-arm uses Docker (or Podman)
      To install Docker Desktop, run:
        brew install --cask docker
    EOS
  end

  test do
    system bin/"openfoam-docker-arm", "-help"
  end
end
