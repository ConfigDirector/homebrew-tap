class Configdirector < Formula
  desc "Command-line tool for ConfigDirector feature flags and remote config"
  homepage "https://www.configdirector.com"
  url "https://registry.npmjs.org/@configdirector/cli/-/cli-0.12.0.tgz"
  sha256 "6b0ea3651e4701e21ee0c012a5fc8c75c1781480605a4dc14a7e30d33eb616d8"
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
