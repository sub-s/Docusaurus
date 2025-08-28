# GitHub Pages 배포 가이드

이 문서는 Docusaurus 웹사이트를 GitHub Pages에 배포하는 방법을 설명합니다.

## 1. GitHub 저장소 생성

1. GitHub에서 새 저장소를 생성합니다 (예: `my-website`)
2. 저장소를 공개(public)로 설정합니다

## 2. 로컬 저장소 설정

```bash
# 현재 디렉토리에서 Git 초기화
git init

# 원격 저장소 추가 (YOUR_USERNAME과 REPO_NAME을 실제 값으로 변경)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# 기본 브랜치를 main으로 설정
git branch -M main
```

## 3. 파일 커밋 및 푸시

```bash
# 모든 파일 추가
git add .

# 커밋
git commit -m "Initial commit: Docusaurus website setup"

# GitHub에 푸시
git push -u origin main
```

## 4. GitHub Pages 설정

1. GitHub 저장소 페이지로 이동
2. Settings 탭 클릭
3. 왼쪽 메뉴에서 "Pages" 클릭
4. Source 섹션에서 "GitHub Actions" 선택
5. 저장

## 5. 자동 배포 확인

- `main` 브랜치에 푸시하면 자동으로 GitHub Actions가 실행됩니다
- Actions 탭에서 배포 진행 상황을 확인할 수 있습니다
- 배포가 완료되면 `https://YOUR_USERNAME.github.io/REPO_NAME/`에서 웹사이트를 확인할 수 있습니다

## 6. 커스터마이징

### 사이트 제목 및 설명 변경
`docusaurus.config.ts` 파일에서 다음 설정을 수정하세요:

```typescript
const config: Config = {
  title: '당신의 사이트 제목',
  tagline: '사이트 설명',
  // ...
}
```

### GitHub 정보 업데이트
`docusaurus.config.ts` 파일에서 다음 설정을 수정하세요:

```typescript
const config: Config = {
  // ...
  organizationName: 'YOUR_GITHUB_USERNAME',
  projectName: 'YOUR_REPO_NAME',
  // ...
}
```

## 7. 문제 해결

### 배포가 실패하는 경우
1. GitHub Actions 로그를 확인하세요
2. Node.js 버전이 18 이상인지 확인하세요
3. 저장소가 공개로 설정되어 있는지 확인하세요

### 사이트가 표시되지 않는 경우
1. GitHub Pages 설정에서 소스가 "GitHub Actions"로 설정되어 있는지 확인하세요
2. 배포 URL이 올바른지 확인하세요
3. 브라우저 캐시를 지우고 다시 시도해보세요

## 8. 추가 리소스

- [Docusaurus 공식 문서](https://docusaurus.io/docs)
- [GitHub Pages 문서](https://pages.github.com/)
- [GitHub Actions 문서](https://docs.github.com/en/actions)
