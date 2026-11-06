class Foamlib < Formula
  include Language::Python::Virtualenv

  desc "Modern Python package for interacting with OpenFOAM"
  homepage "https://github.com/gerlero/foamlib"
  url "https://files.pythonhosted.org/packages/b4/50/a5fe7e2f65d61a949cbdb0a727308c2ffd195e7e5b80068fd7f59b9f33b2/foamlib-1.10.2.tar.gz"
  sha256 "7f050a14cb699169c84e9b90f291421b395617b8a788386d1ce5f6486a792ed5"
  license "GPL-3.0-only"
  head "https://github.com/gerlero/foamlib.git", branch: "main"

  bottle do
    root_url "https://github.com/gerlero/homebrew-openfoam/releases/download/foamlib-1.8.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f820c4bdd46d3a0c8be1da7ed2ba91df61a5eb2264a48392e3e37810a2bf4ab1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "85fa57cf41b236f46c6967d908d560abada1a3b9057ee486981fb57f7b39c185"
  end

  depends_on "rust" => :build # for uv_build > maturin
  depends_on "numpy" => :no_linkage
  depends_on "python@3.14"

  pypi_packages exclude_packages: "numpy"

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
    url "https://files.pythonhosted.org/packages/b4/58/40f20f664534a3df1803c71cf2620b56c9be3efe09f1be5a9defd6850f98/multicollections-2.0.0.tar.gz"
    sha256 "923b232d4f0b65466279d7a5c986a0d1a251dcb546b95597df0483c2eef3fe35"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  def python3
    which("python3.14")
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
