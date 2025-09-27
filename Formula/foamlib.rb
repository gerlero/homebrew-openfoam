class Foamlib < Formula
  include Language::Python::Virtualenv

  desc "Modern Python package for interacting with OpenFOAM"
  homepage "https://github.com/gerlero/foamlib"
  url "https://files.pythonhosted.org/packages/5b/da/7426f135f66be377f721d855cd32e1dd0423beeba2a967ede99c3a2cc74f/foamlib-1.3.11.tar.gz"
  sha256 "12d92e13dd0611a73d89007d45b1cfa916f113968e0641cbd7a986030fe3cde0"
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
    url "https://files.pythonhosted.org/packages/10/65/0c8ad113380e4765f74d144547592b22a33363f3e1ed158d4ad441ac74d6/multicollections-1.0.5.tar.gz"
    sha256 "a58c28581dc2d981237c5a60d66028e6ef596858f75f2a3dcfb0091ebfe1c788"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/d0/19/95b3d357407220ed24c139018d2518fab0a61a948e68286a25f1a4d049ff/numpy-2.3.3.tar.gz"
    sha256 "ddc7c39727ba62b80dfdbedf400d1c10ddfa8eefbd7ec8dcb118be8b56d31029"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/f2/a5/181488fc2b9d093e3972d2a472855aae8a03f000592dbfce716a512b3359/pyparsing-3.2.5.tar.gz"
    sha256 "2df8d5b7b2802ef88e8d016a2eb9c7aeaa923529cd251ed0fe4608275d4105b6"
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
