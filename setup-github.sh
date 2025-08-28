#!/bin/bash

# GitHub Pages 배포 설정 스크립트
# 이 스크립트는 GitHub 저장소 설정을 도와줍니다.

echo "🚀 GitHub Pages 배포 설정을 시작합니다..."

# 사용자 입력 받기
read -p "GitHub 사용자명을 입력하세요: " GITHUB_USERNAME
read -p "저장소 이름을 입력하세요 (예: my-website): " REPO_NAME

echo ""
echo "📋 다음 단계를 따라주세요:"
echo ""

echo "1️⃣  GitHub에서 새 저장소를 생성하세요:"
echo "   - 저장소 이름: $REPO_NAME"
echo "   - 공개(Public)로 설정"
echo "   - README 파일 생성하지 않기"
echo ""

echo "2️⃣  다음 명령어를 실행하세요:"
echo "   git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""

echo "3️⃣  GitHub 저장소 설정:"
echo "   - Settings > Pages"
echo "   - Source: GitHub Actions 선택"
echo ""

echo "4️⃣  배포 확인:"
echo "   - Actions 탭에서 배포 진행 상황 확인"
echo "   - 배포 완료 후 https://$GITHUB_USERNAME.github.io/$REPO_NAME/ 에서 확인"
echo ""

echo "✅ 설정이 완료되면 웹사이트가 자동으로 배포됩니다!"
echo ""

# 설정 파일 업데이트 안내
echo "📝 추가 설정:"
echo "   docusaurus.config.ts 파일에서 다음 정보를 확인하세요:"
echo "   - organizationName: '$GITHUB_USERNAME'"
echo "   - projectName: '$REPO_NAME'"
echo "   - baseUrl: '/$REPO_NAME/'"
echo ""
