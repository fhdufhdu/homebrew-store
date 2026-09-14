# 이 파일은 tap 레포(fhdufhdu/homebrew-store)의 Casks/flex-menubar.rb 의 참조 사본입니다.
# 실제 배포 시 version/sha256 은 .github/workflows/release.yml 가 tap 레포 쪽을 자동 갱신합니다.
cask "flex-menubar" do
  version "1.0.11"
  sha256 "5bb14f56a758f7659e27fbe89a378e97a5f6925afe5154a73670145a7e3b6e8f"

  url "https://github.com/fhdufhdu/homebrew-store/releases/download/flex-menubar-v#{version}/flex-menubar.zip"
  name "flex-menubar"
  desc "flex.team 주간 근무시간을 macOS 메뉴바에 표시"
  homepage "https://github.com/fhdufhdu/homebrew-store"

  depends_on :macos

  app "flex-menubar.app"

  caveats <<~EOS
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
