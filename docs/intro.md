---
sidebar_position: 1
---

# 가이드 소개

**5분 안에 Docusaurus를 알아보세요**.

## 시작하기

**새로운 사이트를 만들어** 시작해보세요.

또는 **[docusaurus.new](https://docusaurus.new)**에서 **즉시 Docusaurus를 체험**해보세요.

### 필요한 것들

- [Node.js](https://nodejs.org/en/download/) 18.0 버전 이상:
  - Node.js 설치 시, 의존성 관련 모든 체크박스를 선택하는 것을 권장합니다.

## 새 사이트 생성하기

**classic 템플릿**을 사용하여 새로운 Docusaurus 사이트를 생성하세요.

다음 명령어를 실행하면 classic 템플릿이 자동으로 프로젝트에 추가됩니다:

```bash
npm init docusaurus@latest my-website classic
```

이 명령어는 Command Prompt, Powershell, Terminal 또는 코드 에디터의 통합 터미널에서 실행할 수 있습니다.

이 명령어는 Docusaurus를 실행하는 데 필요한 모든 의존성도 함께 설치합니다.

## 사이트 시작하기

개발 서버를 실행하세요:

```bash
cd my-website
npm run start
```

`cd` 명령어는 작업 디렉토리를 변경합니다. 새로 생성된 Docusaurus 사이트로 작업하려면 터미널에서 해당 디렉토리로 이동해야 합니다.

`npm run start` 명령어는 웹사이트를 로컬에서 빌드하고 개발 서버를 통해 제공하여 http://localhost:3000/에서 확인할 수 있게 합니다.

`docs/intro.md` (이 페이지)를 열고 몇 줄을 편집해보세요: 사이트가 **자동으로 새로고침**되어 변경사항을 표시합니다.
