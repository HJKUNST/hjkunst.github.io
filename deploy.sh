#!/bin/bash

# Hugo 사이트 자동 빌드 & 배포 스크립트

echo "🍓 Building Hugo site..."
hugo --minify

if [ $? -ne 0 ]; then
    echo "❌ Hugo build failed!"
    exit 1
fi

echo "📦 Deploying to GitHub Pages..."

# gh-pages 워크트리가 없으면 생성
if [ ! -d "../_deploy" ]; then
    echo "Creating gh-pages worktree..."
    git worktree add ../_deploy gh-pages
fi

# 기존 파일 정리 후 새 빌드 복사
cd ../_deploy
git rm -rf --quiet . 2>/dev/null || true
cp -R ../strawberry-hugo/public/* .

# .nojekyll 파일 추가 (GitHub Pages Jekyll 처리 방지)
touch .nojekyll

# 커밋 & 푸시
git add -A
if git diff --staged --quiet; then
    echo "✅ No changes to deploy"
else
    git commit -m "deploy: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin gh-pages
    echo "🚀 Deployed successfully!"
    echo "📍 Site will be available at: https://hjkunst.github.io"
fi

cd ../strawberry-hugo
echo "✨ Done!" 