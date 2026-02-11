---
layout: post
title: "From Design to Implementation: Connecting Figma and Cursor MCP (Basics)"
date: 2025-06-15 02:04:00 +0900
categories: [Front-End]
translationKey: "2025-06-15-figma-to-code"
aliases:
  - /posts/2025-06-15-figma-to-code/
---

<div markdown="1">

### Purpose
I wanted to integrate Cursor AI with Figma files to directly convert design resources into code. In most other design and art disciplines, the work is considered "complete" only when the final product is finished — so why should implementation in UX/UI design be solely the developer's responsibility? This was a challenge to that question. Ultimately, I think what I really wanted was to build a website driven by a sense of authorship.

</div>

<div class="spacer"></div>

<div markdown="1">

### Doubts About Feasibility

-  Even if the appearance can be replicated, can things like flex, grid layout, margin/padding, and textures be faithfully transferred exactly as I designed them?

- Wouldn't the development effort double? With lovable and v0, it felt like they just threw code at you, so I never wanted to use them in actual production. Design ultimately plays an irreplaceable role in providing emotional refinement to a product, yet those tools only focused on trends and simplicity without being truly user-friendly.

-  Can prototypes with animations also be implemented?
    - In Figma, prototypes and animations are built through frame-to-frame connections, but wouldn't it be difficult when connecting via MCP on a single-frame basis?
    - If animation is possible, which library would be most effective?

- How are states like hover implemented?

-  How can components that require JavaScript be handled? Wouldn't it just render the screen while ignoring the functionality?

</div>

<div class="spacer"></div>

<div markdown="1">

### Why I'm Writing This Blog Post

Most people just show the final result after completing the Cursor integration. I wanted to make it so that even someone without a development background could use Figma + Cursor MCP. Of course, it was a meaningful process of trial and error, but I hope others can develop quickly without going through the same struggles I did. Since this is a skill needed to reduce communication overhead between designers and developers and to build faster, more satisfying products together, I hope many people will find this useful.

</div>

<div class="spacer"></div>

<div markdown="1">

### So, What Was the Result?
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
    It produced a fairly well-structured and clean result. This landing page was an opportunity where I could handle nearly the entire process up to just before deployment.
    <br/><br/> Unfortunately, I did have to customize the carousel and motion effects (though I did get a bit of help from AI for that too), but Cursor was a huge help with the initial structure and design system.
    <br/><br/> If you follow the steps below, you too can build a landing page like the one shown here! (Probably.) Here's a glimpse of the parts I can show without revealing the site name.
  </p>
  <div class="responsive-images" style="display: flex; flex-direction: column;">
    <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/1.png" alt="Cursor AI와 Figma 연동으로 제작된 랜딩페이지 상단 메인 섹션" style="width: 100%; min-width: 600px; height: auto; display: block; text-align: left;"/>
    <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/2.png" alt="Cursor AI와 Figma 연동으로 제작된 랜딩페이지 하단 섹션"  style="width: 100%; min-width: 600px; height: auto; display: block; text-align: left;" />
   </div>
</div>


</div>

<div class="spacer"></div>

### Steps

<div class="spacer"></div>

#### 1. Open the Frame you want to connect in your Figma file
   <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/3.png" alt="Figma에서 프레임 열기 - 디자인 파일에서 연결할 프레임을 선택하는 화면" style="display: block; text-align: left;"/>

<div class="spacer"></div>

#### 2. Log in to Cursor
   - 2-week free trial per account
   - US students can use the Pro plan for free
   - I went through 3 accounts, got IP-banned, and ended up paying for 1 year of Pro
     <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/cursor.png" alt="Cursor AI 로그인 화면 - Pro 요금제 정보와 무료 기간 안내" style="display: block; text-align: left;"/>

<div class="spacer"></div>

#### 3. Go to Cursor Settings > MCP Tools > Click New MCP Server
Paste the following into the generated `mcp.json` file:
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

#### 4. You need to fill in the `--figma-api-key=YOUR-KEY` part
  - Go to Figma > Settings > Security and click 'Generate new token'
  - Enter a name you can identify it by, select the Scopes, and generate it
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/4.png" alt="Figma 설정 화면 - Security 탭에서 API 토큰 생성하는 과정" style="display: block; text-align: left;"/>

  - Click Copy this token and paste it into `YOUR-KEY`
  - Be careful not to include it when asking questions to AI chatbots like GPT
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/5.png" alt="Figma API 토큰 복사 화면 - 생성된 토큰을 안전하게 복사하는 과정" style="display: block; text-align: left;"/>

<div class="spacer"></div>

#### 5. Once the setup is complete, you should see the following screen
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/6.png" alt="MCP 서버 설정 완료 화면 - Figma MCP가 성공적으로 연결된 상태" style="display: block; text-align: left;"/>

<div class="spacer"></div>

#### 4. By now you should have pasted everything into mcp.json — close it and go back to Cursor Settings. The JSON you just created should appear like this.
Turn on the MCP server toggle if it's off
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/7.png" alt="Cursor MCP 설정 화면 - 토글 버튼으로 서버 활성화" style="display: block; text-align: left;"/>

<div class="spacer"></div>

### Requesting Implementation via Cursor Chat
In this basics guide, we'll skip advanced prompting and settings and just focus on getting things built.
Open Cursor Chat and type the following:

```md
implement this figma file and generate a new react project by (html/css/javascript or react or next app) on desktop @(링크)
```

<div class="spacer"></div>

**Additional prompt:**

```text
I need new project and want you to adapt get_figma_data
Always choose the best consideration for this project
```

- If the connection is successful, you'll see a screen like this:
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/8.png" alt="Cursor Chat에서 Figma 파일 연동 성공 화면" style="display: block; text-align: left;"/>

- After reviewing the generated code, click the **Accept button** in the bottom right
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/9.png" alt="Cursor Accept 버튼 화면 - 생성된 코드를 승인하는 과정" style="display: block; text-align: left;"/>

<div class="spacer"></div>

### Running Locally

I generated a `next app`, then ran the local server:
It was a simple component page, but Figma's auto-layout settings were well reflected in the div structure.
  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/10.png" alt="로컬 개발 환경 - Next.js 프로젝트 실행 결과" style="display: block; text-align: left;"/>

  <img src="https://raw.githubusercontent.com/HJKUNST/github-blog-images/main/assets/25-06-15-figma-to-code/11.png" alt="생성된 웹 애플리케이션 실행 결과 - Figma 디자인이 코드로 변환된 최종 결과물" style="display: block; text-align: left;"/>

<div class="spacer"></div>

### Useful References

- [Figma Context MCP GitHub](https://github.com/GLips/Figma-Context-MCP)
- [Framelink Quickstart Docs](https://www.framelink.ai/docs/quickstart)
- [Cursor Experiment Log - reese-log](https://www.reese-log.com/cursor-figma-model-context-protocol)
