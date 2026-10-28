class Configdirector < Formula
  desc "Command-line tool for ConfigDirector feature flags and remote config"
  homepage "https://www.configdirector.com"
  url "https://registry.npmjs.org/@configdirector/cli/-/cli-0.14.0.tgz"
  sha256 "4961bb51435a05fea556fb52c400433a77e00bbfa562c4e6ecc64bd4dea2380f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/configdirector --version")
  end
end
