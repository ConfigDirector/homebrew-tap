class Configdirector < Formula
  desc "Command-line tool for ConfigDirector feature flags and remote config"
  homepage "https://www.configdirector.com"
  url "https://registry.npmjs.org/@configdirector/cli/-/cli-0.23.0.tgz"
  sha256 "b0f484cbd54117b6bbd578f82ef28c553bde7a99068dad6138ccaf4bbebccd89"
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
