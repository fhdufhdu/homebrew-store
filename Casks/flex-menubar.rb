# 이 파일은 GitHub Actions(메인 레포 .github/workflows/release.yml)가
# 릴리스마다 version / sha256 을 자동 갱신합니다. 수동 편집 불필요.
cask "flex-menubar" do
  version "1.0.0"
  sha256 "84f44e4fef412c0e2e2da994325c9b36d9d48de4b09a41f6b196bcb1cc566994"

  url "https://github.com/fhdufhdu/homebrew-store/releases/download/flex-menubar-v#{version}/flex-menubar.zip"
  name "flex-menubar"
  desc "flex.team 주간 근무시간을 macOS 메뉴바에 표시"
  homepage "https://github.com/fhdufhdu/homebrew-store"

  depends_on macos: ">= :catalina"

  app "flex-menubar.app"

  caveats <<~EOS
    flex-menubar 는 Apple Developer 인증서로 서명/공증되지 않았습니다.
    Homebrew 는 기본으로 quarantine 표식을 붙이므로, 경고 없이 설치하려면:

      brew install --cask --no-quarantine flex-menubar

    이미 quarantine 상태로 설치했다면 표식만 제거할 수 있습니다:
      xattr -dr com.apple.quarantine "/Applications/flex-menubar.app"

    첫 실행 시 flex.team 로그인 창이 뜹니다. (앱은 자격증명을 저장하지 않습니다)
  EOS

  zap trash: [
    "~/.config/flex-work-record-calculator-menubar-app",
    "~/Library/WebKit/team.flex.menubar",
    "~/Library/Caches/team.flex.menubar",
    "~/Library/Preferences/team.flex.menubar.plist",
    "~/Library/Saved Application State/team.flex.menubar.savedState",
  ]
end
