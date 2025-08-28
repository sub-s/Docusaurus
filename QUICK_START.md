# 🚀 빠른 시작 가이드

Docusaurus 웹사이트가 성공적으로 설정되었습니다! 이제 GitHub Pages에 배포하세요.

## 📋 완료된 작업

✅ Docusaurus 프로젝트 생성  
✅ 한국어 로컬라이제이션 적용  
✅ GitHub Actions 배포 설정  
✅ 커스텀 설정 및 스타일링  
✅ 배포 가이드 및 스크립트 생성

## 🎯 다음 단계

### 1. GitHub 저장소 생성

1. GitHub에서 새 저장소 생성 (예: `my-website`)
2. 저장소를 **공개(Public)**로 설정
3. README 파일 생성하지 않기

### 2. 로컬 저장소 연결

```bash
# 원격 저장소 추가 (YOUR_USERNAME과 REPO_NAME을 실제 값으로 변경)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# 기본 브랜치를 main으로 설정
git branch -M main

# GitHub에 푸시
git push -u origin main
```

### 3. GitHub Pages 설정

1. GitHub 저장소 페이지 → Settings
2. 왼쪽 메뉴 → Pages
3. Source → **GitHub Actions** 선택
4. 저장

### 4. 자동 배포 확인

- 푸시 후 자동으로 GitHub Actions 실행
- Actions 탭에서 배포 진행 상황 확인
- 배포 완료 후 `https://YOUR_USERNAME.github.io/REPO_NAME/`에서 확인

## 🛠️ 로컬 개발

```bash
# 개발 서버 시작
npm start

# 빌드 테스트
npm run build

# 빌드된 사이트 로컬에서 확인
npm run serve
```

## 📁 주요 파일

- `docusaurus.config.ts` - 메인 설정 파일
- `.github/workflows/deploy.yml` - GitHub Actions 배포 설정
- `DEPLOYMENT_GUIDE.md` - 상세한 배포 가이드
- `setup-github.sh` - GitHub 설정 도우미 스크립트

## 🎨 커스터마이징

### 사이트 정보 변경

`docusaurus.config.ts`에서 다음 설정을 수정하세요:

- `title`: 사이트 제목
- `tagline`: 사이트 설명
- `organizationName`: GitHub 사용자명
- `projectName`: 저장소 이름

### 콘텐츠 추가

- `docs/` - 문서 추가
- `blog/` - 블로그 포스트 추가
- `src/pages/` - 새 페이지 추가

## 🔧 문제 해결

### 빌드 오류

```bash
npm ci  # 의존성 재설치
npm run build  # 빌드 재시도
```

### 배포 실패

1. GitHub Actions 로그 확인
2. 저장소가 공개로 설정되어 있는지 확인
3. GitHub Pages 설정에서 "GitHub Actions" 선택 확인

## 📞 지원

문제가 발생하면 다음을 확인하세요:

- [Docusaurus 공식 문서](https://docusaurus.io/docs)
- [GitHub Pages 문서](https://pages.github.com/)
- [GitHub Actions 문서](https://docs.github.com/en/actions)

---

**🎉 축하합니다! Docusaurus 웹사이트가 준비되었습니다!**
