class Foamlib < Formula
  include Language::Python::Virtualenv

  desc "Modern Python package for interacting with OpenFOAM"
  homepage "https://github.com/gerlero/foamlib"
  url "https://files.pythonhosted.org/packages/92/4e/0bbac4ceb407181afce1b6ef074d12560d18bbaa2ee426189b770b4b4ce9/foamlib-1.6.1.tar.gz"
  sha256 "1c00dd0be82ddf45067165a05a5f876222f76d967a46d4c86d9728919954105e"
  license "GPL-3.0-only"
  head "https://github.com/gerlero/foamlib.git", branch: "main"

  depends_on "numpy"
  depends_on "python@3.13"

  resource "aioshutil" do
    url "https://files.pythonhosted.org/packages/d3/bd/dcea5abb1792269e70cc75d5f9ae9adbdfba0f0d08a207eb788ec3b469b6/aioshutil-1.6.tar.gz"
    sha256 "9eae342b9a4cacc2c2c5877877a2d2f7a2b66c62aa1ab57d7e95c8cfd4ede507"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "multicollections" do
    url "https://files.pythonhosted.org/packages/1a/9a/b0993de2190d9dff89f930cba923b1071cd53f8343052bfb97de238a2ae6/multicollections-1.0.8.tar.gz"
    sha256 "aaeb7b2c1f4a54a508867935068569229a67f9be33fa93dbc182221e27b6976a"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/22/fd/89965aa4ac08c74998539fcbf24fa3540f3e15237fbeb6bcf9c908f4aade/numpy-2.5.1.tar.gz"
    sha256 "a48a113e6afea91f5608793bafa7ef2ad481fefbda87ec5069f483de61cb9fa3"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c/pygments-2.20.0.tar.gz"
    sha256 "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
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
