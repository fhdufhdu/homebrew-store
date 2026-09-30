# Release automation replaces version and sha256 before publishing this cask to
# fhdufhdu/homebrew-store. This source copy is a template, not an installable release.
cask "local-envs" do
  version "1.0.0"
  sha256 "a19db645513e7c659b4c21b353f9402a34bb839698c6158053a3e1cc515b9f3d"

  url "https://github.com/fhdufhdu/homebrew-store/releases/download/local-envs-v#{version}/local-envs.zip"
  name "Local Envs"
  desc "Encrypted environment profiles for macOS apps and CLI commands"
  homepage "https://github.com/fhdufhdu/homebrew-store"

  depends_on macos: :sonoma

  app "Local Envs.app"
  binary "#{appdir}/Local Envs.app/Contents/MacOS/le"
end
