class Configdirector < Formula
  desc "Command-line tool for ConfigDirector feature flags and remote config"
  homepage "https://www.configdirector.com"
  url "https://registry.npmjs.org/@configdirector/cli/-/cli-0.15.0.tgz"
  sha256 "0eb502e47749ba3f9e8d5b2fbf45d90e8b1d32463b2d9b89b08838f01c205148"
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
