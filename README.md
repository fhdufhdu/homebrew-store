# homebrew-flex

[flex-menubar](https://github.com/fhdufhdu/flex-work-record-calculator-menubar-app) 배포용 Homebrew tap.

## 설치

```bash
brew tap fhdufhdu/flex
brew install --cask --no-quarantine flex-menubar
```

> `--no-quarantine` 는 무서명(미공증) 앱의 게이트키퍼 경고를 우회합니다.
> 빼고 설치하면 첫 실행 시 "확인되지 않은 개발자" 경고가 뜹니다(우클릭 → 열기로 우회 가능).

## 업데이트 / 제거

```bash
brew upgrade --cask flex-menubar
brew uninstall --cask flex-menubar
```

## 메인테이너 참고

`Casks/flex-menubar.rb` 의 `version` / `sha256` 은 메인 레포의 GitHub Actions가
릴리스마다 자동으로 갱신·커밋합니다. 수동 편집할 필요가 없습니다.
