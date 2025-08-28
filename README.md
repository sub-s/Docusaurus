# 내 웹사이트

이 웹사이트는 [Docusaurus](https://docusaurus.io/)를 사용하여 구축되었습니다. Docusaurus는 현대적인 정적 웹사이트 생성기입니다.

## 설치

```bash
npm install
```

## 로컬 개발

```bash
npm start
```

이 명령어는 로컬 개발 서버를 시작하고 브라우저 창을 엽니다. 대부분의 변경사항은 서버를 재시작하지 않고도 실시간으로 반영됩니다.

## 빌드

```bash
npm run build
```

이 명령어는 `build` 디렉토리에 정적 콘텐츠를 생성하며, 모든 정적 콘텐츠 호스팅 서비스에서 제공할 수 있습니다.

## 배포

GitHub Pages를 사용한 배포:

```bash
npm run deploy
```

이 명령어는 웹사이트를 빌드하고 `gh-pages` 브랜치에 푸시하는 편리한 방법입니다.

## GitHub Actions를 통한 자동 배포

이 프로젝트는 GitHub Actions를 사용하여 자동으로 GitHub Pages에 배포됩니다. `main` 또는 `master` 브랜치에 푸시하면 자동으로 배포가 시작됩니다.
