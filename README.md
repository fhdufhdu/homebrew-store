# homebrew-store

fhdufhdu 의 macOS 앱 배포용 Homebrew tap. 여러 앱을 한 곳에서 관리합니다.

## 사용법

```bash
brew tap fhdufhdu/store
brew trust fhdufhdu/store   # 서드파티 tap 신뢰 (Homebrew 5.x, 최초 1회)
```

탭을 등록·신뢰한 뒤, 아래 목록의 앱을 설치하세요.
(Homebrew 5.x 는 서드파티 tap 의 cask 설치 전에 `brew trust` 를 요구합니다.)

## 배포 앱 목록

| 앱 | 설명 | 설치 |
|----|------|------|
| [`flex-menubar`](https://github.com/fhdufhdu/flex-work-record-calculator-menubar-app) | flex.team 주간 근무시간을 macOS 메뉴바에 표시 | `brew install --cask flex-menubar` |

> 대부분의 앱은 Apple Developer 인증서로 서명/공증되지 않았습니다. Homebrew(4.7+)가 quarantine
> 표식을 붙이고 `--no-quarantine` 플래그는 제거됐으므로, **설치 후 표식 제거**가 필요합니다:
>
> ```bash
> xattr -dr com.apple.quarantine "/Applications/<앱>.app"
> ```
>
> (또는 Finder 에서 앱 우클릭 → 열기)

## 업데이트 / 제거

```bash
brew upgrade --cask <앱이름>
brew uninstall --cask <앱이름>
```

## 메인테이너 참고

### 구조
- `Casks/<앱>.rb` — 앱별 Cask 정의
- 각 앱의 빌드 바이너리(zip)는 **이 레포의 Release** 에 호스팅됩니다.
  앱끼리 버전 태그가 충돌하지 않도록 릴리스 태그를 앱 이름으로 네임스페이스합니다:
  `<앱>-v<버전>` (예: `flex-menubar-v1.0.0`).

### 새 앱 추가하기
1. 이 레포에 `Casks/<앱>.rb` 추가 (url 은 `…/releases/download/<앱>-v#{version}/<자산>.zip`)
2. 앱 소스 레포에 릴리스 워크플로 추가 — `v*` 태그 푸시 시:
   - 빌드 → zip 압축
   - 이 레포(`fhdufhdu/homebrew-store`)의 Release 에 `<앱>-v<버전>` 태그로 업로드
   - 이 레포의 `Casks/<앱>.rb` 의 `version`·`sha256` 자동 갱신·커밋
3. 워크플로는 `homebrew-store` 쓰기 권한 PAT(`TAP_TOKEN` 시크릿)로 푸시합니다.

> 소스 레포는 private 이어도 됩니다. 다운로드되는 바이너리는 이 public 레포에서 제공됩니다.
