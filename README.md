# Strawberry Fields

개발과 디자인에 대한 생각을 기록하는 블로그입니다.

## 기술 스택

- **Static Site Generator**: Hugo
- **Theme**: [hugo-discaptive](https://github.com/discaptive/hugo-discaptive)
- **Deployment**: GitHub Pages

## 로컬 개발

```bash
# Hugo 서버 실행
hugo server

# 빌드
hugo
```

## 배포

```bash
# deploy.sh 스크립트 사용
./deploy.sh
```

## 프로젝트 구조

```
strawberry-hugo/
├── content/          # 콘텐츠 파일들
│   ├── posts/        # 블로그 포스트
│   └── about/        # About 페이지
├── layouts/          # 커스텀 레이아웃
├── static/           # 정적 파일 (이미지, 폰트 등)
├── assets/           # CSS 등 에셋
└── themes/           # Hugo 테마
```
