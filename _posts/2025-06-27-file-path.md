---
layout: post
title: "파일 절대경로, 상대경로 표기법"
date: 2025-06-27 00:00:00 +0900
categories: [Front-End]
---

### 적는 이유
계속 찾아보기 시간 아까워서 이참에 외우자 하는 마음에 적어본다

<div class="spacer"></div>

### 상대 경로

```
/ : 최상위 디렉토리
./ : 현재 디렉토리
../ : 현재 디렉토리의 상위 디렉토리
```

### 예시 : 

```
.
├── 404.html
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── README.md
├── _config.yml
├── _layouts
│   ├── default.html
│   ├── page.html
│   └── post.html
├── _posts
│   ├── 2025-06-01-welcome-to-jekyll.markdown
│   ├── 2025-06-15-figma-to-code.md
│   ├── 2025-06-26-file-path.md
│   ├── 2025-06-26-sum.md
│   └── template.md
...
```

<div class="spacer"></div>

#### 현재 파일이 `2025-06-26-file-path.md` 일 때

<div class="spacer"></div>

1. `2025-06-15-figma-to-code.md` 의 
  - 상대경로 : `./2025-06-15-figma-to-code.md`
  - 절대경로 : `strawberry-field/_posts/2025-06-15-figma-to-code.md`
2. `404.html` 의 
  - 상대경로 : `../404.html`
  - 절대경로 : `strawberry-field/404.html`

절대경로에서 폴더 : `_post` 로 쓰기. 