---
layout: post
title: "디자인에서 구현까지: Figma와 Cursor MCP를 연결해봤다 (기본편)"
date: 2025-06-15 02:04:00 +0900
categories: [Front-End, Project]
tags: [Front-End, Project]
translationKey: "2025-06-15-figma-to-code"
---

<div markdown="1">

### 목적
Cursor AI와 Figma 파일을 연동시켜서, 디자인 리소스를 바로 코드로 전환해보고자 했다. 다른 대부분의 디자인과 예술은 프로덕트 완성까지를 '완성'으로 보는데, 왜 UX, UI 디자인만 구현은 개발자의 몫이어야 할까? 그 질문에 대한 도전이었다. 결론적으로 작가 의식에 기반한 웹사이트 제작을 해보고 싶었던 것 같다.

</div>

<div class="spacer"></div>

<div markdown="1">

### 가능성에 대한 의문들

-  외형은 구현할 수 있더라도, flex, grid layout, margin/padding, 질감 표현까지 내가 만든 대로 옮겨질 수 있을까?

- 개발 공수가 두 배가 되지는 않을까? lovable과 v0에서는 코드만 던져주는 느낌이라 실제 프로덕션에 적용하고 싶지 않았다. 디자인이란 결국 프로덕트에서 감성적인 보완점을 주는 역할을 빼놓을 수 없는데, 트렌드와 간결함에만 충실하고 친화적이지 않았다.

-  Animation이 들어간 prototype도 구현 가능할까?  
    - Figma에서는 프레임 간 연결로 prototype과 animation을 구현하지만, 단일 프레임 기반으로 MCP를 연결하면 어렵지 않을까?  
    - 애니메이션이 가능하다면, 어떤 library이 효과적일까?

- hover 같은 상태(state)는 어떻게 구현되는가?

-  JavaScript로 구현이 필요한 component들은 어떻게 처리할 수 있을까? 단순히 화면만 구성되고 기능은 무시되는 게 아닌가?

</div>

<div class="spacer"></div>

<div markdown="1">

### 이 블로그를 남기는 이유

다른 사람들은 Cursor 연동만 완료한 뒤, 결과물만 보여준다. 개발 배경 지식이 없는 사람이 보더라도 Figma + Cursor MCP를 사용할 수 있도록 만들고 싶었다. 물론 의미있는 삽질이었지만, 다른 사람들은 나와 같은 시행착오를 겪지 않고 빠르게 개발을 하길 바란다. 디자이너와 개발자 간 소통 공수를 줄여, 더 빠르고 만족스러운 제품을 함께 만들어가기 위해 필요한 기술인 만큼 많이들 봐주었으면 좋겠다.

</div>

<div class="spacer"></div>

<div markdown="1">

### 그래서 결과는?
<style>
@media (max-width: 600px) {
  .responsive-flex {
    flex-direction: column !important;
  }
  .responsive-text {
    min-width: auto !important;
  }
  .responsive-images {
    min-width: auto !important;
  }
}
</style>

<div class="responsive-flex" style="display: flex; gap: 16px; align-items: flex-start;">
  <p class="responsive-text" style="line-height: 1.6; min-width: 400px;">
    꽤나 구조적으로, 예쁘게 뽑아줬던 것 같다. 이 랜딩페이지는 배포 직전까지의 거의 모든 과정을 내가 담당할 수 있었던 기회였다.
    <br/><br/> 아쉽게도 Carousel이나 모션 등은 커스텀 해야하긴 했지만 (그러나 이것도 AI와 조금 함께하긴 했다), 초기 구조나 디자인 시스템은 Cursor의 도움을 많이 받았다.
    <br/><br/> 아래 과정을 따라 하면, 여러분도 아래와 같은 랜딩페이지를 만들 수 있다! (아마도) 사이트 이름 안나오게 보여줄 수 있는 부분만 올려보자면 이런 느낌이다.
  </p>
  <div class="responsive-images" style="display: flex; flex-direction: column;">
    <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/1.png" alt="Cursor AI와 Figma 연동으로 제작된 랜딩페이지 상단 메인 섹션" style="width: 100%; min-width: 600px; height: auto; display: block; text-align: left;"/>
    <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/2.png" alt="Cursor AI와 Figma 연동으로 제작된 랜딩페이지 하단 섹션"  style="width: 100%; min-width: 600px; height: auto; display: block; text-align: left;" />
   </div>
</div>


</div>

<div class="spacer"></div>

### 순서

<div class="spacer"></div>

#### 1. Figma 파일에서 연결할 Frame을 열어두기
   <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/3.png" alt="Figma에서 프레임 열기 - 디자인 파일에서 연결할 프레임을 선택하는 화면" style="display: block; text-align: left;"/>

<div class="spacer"></div>

#### 2. Cursor 로그인
   - 계정당 2주 무료  
   - 미국 학생은 Pro 요금제 무료 사용 가능  
   - 필자는 계정 3개를 넘기면서 IP 밴을 당해 결국 1년 Pro 결제함
     <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/cursor.png" alt="Cursor AI 로그인 화면 - Pro 요금제 정보와 무료 기간 안내" style="display: block; text-align: left;"/>

<div class="spacer"></div>

#### 3. Cursor Settings > MCP Tools > New MCP Server 클릭
생성된 `mcp.json` 파일에 다음 내용 복붙해 입력:
```json
{
  "mcpServers": {
    "Framelink Figma MCP": {
      "command": "npx",
      "args": [
        "-y",
        "figma-developer-mcp",
        "--figma-api-key=YOUR-KEY",
        "--stdio"
      ]
    }
  }
}
```

<div class="spacer"></div>

#### 4. 여기서 `--figma-api-key=YOUR-KEY` 부분을 채워야 하는데
  - Figma > Settings > Security에 들어가서 ‘Generate new token’ 을 누른다
  - 자기가 구분할 수 있는 이름 넣고 만들면 되고, Scopes를 선택해서 생성해준다
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/4.png" alt="Figma 설정 화면 - Security 탭에서 API 토큰 생성하는 과정" style="display: block; text-align: left;"/>

  - Copy this token하고 `YOUR-KEY` 에 넣어준다
  - gpt같은 ai chatbot에 질문할 때 들어가지 않도록 조심하기
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/5.png" alt="Figma API 토큰 복사 화면 - 생성된 토큰을 안전하게 복사하는 과정" style="display: block; text-align: left;"/>

<div class="spacer"></div>

#### 5. 설정을 마쳤다면 다음과 같은 화면이 보일 것이다
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/6.png" alt="MCP 서버 설정 완료 화면 - Figma MCP가 성공적으로 연결된 상태" style="display: block; text-align: left;"/>

<div class="spacer"></div>

#### 4. 지금까지 mcp.json에 복붙했을텐데, 이걸 닫고 다시 cursor setting으로 돌아가자. 방금 만든 json이 적용되어 이렇게 뜰 것이다.
MCP 서버 토글이 꺼져 있다면 켜기
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/7.png" alt="Cursor MCP 설정 화면 - 토글 버튼으로 서버 활성화" style="display: block; text-align: left;"/>

<div class="spacer"></div>

### Cursor Chat으로 구현 요청하기
기본편에서는 심화적인 프롬프팅과 설정보다는 일단 만드는 것만을 소개한다
Cursor Chat을 열고 다음과 같이 입력:

```md
implement this figma file and generate a new react project by (html/css/javascript or react or next app) on desktop @(링크)
```

<div class="spacer"></div>

**추가 프롬프트:**

```text
I need new project and want you to adapt get_figma_data
Always choose the best consideration for this project
```

- 연결이 성공하면 다음과 같은 화면이 보인다:  
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/8.png" alt="Cursor Chat에서 Figma 파일 연동 성공 화면" style="display: block; text-align: left;"/>

- 생성된 코드를 확인 후, 우측 하단 **Accept 버튼 클릭**  
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/9.png" alt="Cursor Accept 버튼 화면 - 생성된 코드를 승인하는 과정" style="display: block; text-align: left;"/>

<div class="spacer"></div>

### 로컬에서 실행하기

나는 `next app`으로 생성한 뒤, 로컬 서버를 실행했다:
간단한 컴포넌트 페이지지만, Figma의 auto-layout 설정이 div 구조로 잘 반영되어 있었다.
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/10.png" alt="로컬 개발 환경 - Next.js 프로젝트 실행 결과" style="display: block; text-align: left;"/>

  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/11.png" alt="생성된 웹 애플리케이션 실행 결과 - Figma 디자인이 코드로 변환된 최종 결과물" style="display: block; text-align: left;"/>

<div class="spacer"></div>

### 참고할만한 자료들

- [Figma Context MCP GitHub](https://github.com/GLips/Figma-Context-MCP)  
- [Framelink Quickstart Docs](https://www.framelink.ai/docs/quickstart)  
- [Cursor 실험기 - reese-log](https://www.reese-log.com/cursor-figma-model-context-protocol)
