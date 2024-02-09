class OpenfoamDockerArm < Formula
  desc "Run script for ARM-based OpenFOAM container images"
  homepage "https://github.com/gerlero/openfoam-docker-arm/"
  url "https://raw.githubusercontent.com/gerlero/openfoam-docker-arm/3f91fefb84989ff2ae5376978458508c7887dbba/openfoam-docker-arm"
  version "2022-01-10"
  sha256 "748e6f98b4a84a06a6d98b4c1c55582f42387162e4315c09827aeedf86df21c9"
  license "GPL-3.0-or-later"
  head "https://raw.githubusercontent.com/gerlero/openfoam-docker-arm/main/openfoam-docker-arm"

  livecheck do
    url :head
    regex(/scriptVersion="?(\d+(-\d+)+)"?/i)
  end

  bottle do
    root_url "https://github.com/gerlero/homebrew-openfoam/releases/download/openfoam-docker-arm-2022-01-10"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e4cae7a8200f4477dc43e2e2cbbcd5b02e6c95cbfdcc160c4fda4fae6919f2fe"
    sha256 cellar: :any_skip_relocation, ventura:      "707ce7fef4d3cc10e29ad188641d71461320f7732a334dcd1487c1a25afc0ae7"
    sha256 cellar: :any_skip_relocation, monterey:     "ee1b811f4a20e084bf5411ca6ee4821a2ecb4a046224bc1f02e5e7dfd3ec6b46"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "39452b0e9820e97ccc5efb5d3e1604744b5e8a36234dfca398a3cac06bfc0c4a"
  end

  deprecate! date: "2024-02-09", because: :deprecated_upstream

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
