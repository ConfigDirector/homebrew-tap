class Configdirector < Formula
  desc "Command-line tool for ConfigDirector feature flags and remote config"
  homepage "https://www.configdirector.com"
  url "https://registry.npmjs.org/@configdirector/cli/-/cli-0.20.0.tgz"
  sha256 "12780be17eb06338bbd9a367a508fcc74443f468b72a819762ad72e2e29b226b"
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
