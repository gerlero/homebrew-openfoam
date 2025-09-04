class Foamlib < Formula
  include Language::Python::Virtualenv

  desc "Modern Python package for interacting with OpenFOAM"
  homepage "https://github.com/gerlero/foamlib"
  url "https://files.pythonhosted.org/packages/41/0b/5ab7e37489ab9febcbfd489314d88e96c06047ba27aeb067c286e125bea4/foamlib-1.2.1.tar.gz"
  sha256 "b8b495bdebcc42a2d698c7204ece49111b09707f1a6e49a1b476a7fdb4f2acc7"
  license "GPL-3.0-only"
  head "https://github.com/gerlero/foamlib.git", branch: "main"

  depends_on "numpy"
  depends_on "python@3.13"

  resource "aioshutil" do
    url "https://files.pythonhosted.org/packages/75/e4/ef86f1777a9bc0c51d50487b471644ae20941afe503591d3a4c86e456dac/aioshutil-1.5.tar.gz"
    sha256 "2756d6cd3bb03405dc7348ac11a0b60eb949ebd63cdd15f56e922410231c1201"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "multicollections" do
    url "https://files.pythonhosted.org/packages/15/7e/a129db1953b2139871c28a7b3a184efb1d2ce836dcc091a90f7b7947caf1/multicollections-1.0.1.tar.gz"
    sha256 "0f9e7ac0bd1fc4a1688a05be538e40f71518624fb4d4fef135c2236e749ecb18"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/37/7d/3fec4199c5ffb892bed55cff901e4f39a58c81df9c44c280499e92cad264/numpy-2.3.2.tar.gz"
    sha256 "e0486a11ec30cdecb53f184d496d1c6a20786c81e55e41640270130056f8ee48"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/bb/22/f1129e69d94ffff626bdb5c835506b3a5b4f3d070f17ea295e12c2c6f60f/pyparsing-3.2.3.tar.gz"
    sha256 "b9c13f1ab8b3b542f72e28f634bad4de758ab3ce4546e4301970ad6fa77c38be"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/fe/75/af448d8e52bf1d8fa6a9d089ca6c07ff4453d86c65c145d0a300bb073b9b/rich-14.1.0.tar.gz"
    sha256 "e497a48b844b0320d45007cdebfeaeed8db2a4f4bcf49f15e455cfc4af11eaa8"
  end

  def python3
    which("python3.13")
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install resources
    system python3, "-m", "pip", "--python=#{venv.root}", "install",
                                 *std_pip_args(prefix: false, build_isolation: true), "."

    (prefix/Language::Python.site_packages(python3)/"homebrew-foamlib.pth").write venv.site_packages
  end

  test do
    system python3.to_s, "-c", "import foamlib"
  end
end
