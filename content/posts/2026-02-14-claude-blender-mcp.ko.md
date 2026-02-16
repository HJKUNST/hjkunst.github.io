---
layout: post
title: "AI로 Blender 제어하기: Claude MCP 연결 가이드 (Mac)"
date: 2026-02-14 12:00:00 +0900
tags: [AI]
image: /claude-blender-mcp/claude-blender-mcp-1.webp
translationKey: "2026-02-09-claude-blender-mcp"
---

회사에 다닐 때 Claude Blender MCP로 모델링을 해서 실무에 썼던 적이 있다. 최근 개인 프로젝트를 다시 시작하면서 같은 환경을 다시 구성하게 되었고, 이번에는 기록으로 남겨두기로 했다.

참고할 만한 블로그 대부분이 Windows 기준으로 작성되어 있어서, 이 글은 Mac 환경을 실제로 사용하는 입장에서 디자이너도 따라할 수 있도록 정리했다.

3D 모델링은 솔직히 잘 못한다. 오브젝트 하나를 만드는 데도 2-3일을 통으로 투입해야 했고, Scene 단위로 작업하면 그보다 훨씬 오래 걸렸다. 그 한계를 보완하고 빠르게 결과물을 내기 위해 시도한 방법이 이것이다.

결과적으로 퀄리티는 만족스러웠다. 다만 2020년형 맥북 프로로 Blender를 돌리다 보니, 작업 중 컴퓨터가 현저하게 느려지는 건 여전히 감수해야 하는 부분이다.

MCP라고 하면 거창하게 들릴 수 있지만, 실제로는 AI 모델과 내가 쓰는 3D 툴을 연결한 것에 불과하다. Blender는 Adobe 계열 툴과 달리 노드 기반으로 작동하기 때문에, AI가 제어하기에 구조적으로 더 적합하다고 판단했다.

이 글을 쓰면서 가장 많이 참고한 레포와 블로그는 다음 두 곳이다.

https://github.com/ahujasid/blender-mcp

https://lightbakery.tistory.com/307

## 설치 순서

1. Claude 데스크탑 앱에 로그인한다.
2. 위에서 언급한 레포를 확인한다.
https://github.com/ahujasid/blender-mcp

1. **uv 설치 (Windows PowerShell 부분의 mac 대응)**

`uv`를 설치한다. `uvx`가 없으면 Claude가 MCP 서버를 시작하지 못한다. 터미널을 열고 아래 명령어를 입력한다.

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

설치 완료 후에는 반드시 쉘을 새로 로드한다.

```bash
source ~/.zshrc
```

1. Claude Desktop으로 돌아가서 좌측 상단의 Settings - Developer를 누른다. `claude_desktop_config.json`이 위치한 폴더가 팝업으로 열린다. 이미 MCP가 설정되어 있는 경우에는 "Edit Config"를 클릭한다.

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-1.webp" alt="Claude Desktop Settings - Developer" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Claude Desktop의 Developer 설정 화면</p>
</div>

1. 아래 JSON을 붙여넣는다.

```json
{
    "mcpServers": {
        "blender": {
            "command": "uvx",
            "args": [
                "blender-mcp"
            ]
        }
    }
}
```

1. 앱을 재시작한다.
2. 파이썬 애드온 파일을 다운로드한다.
https://github.com/ahujasid/blender-mcp/blob/main/addon.py

1. Blender에서 Edit - Preferences - Add-ons - Install 순서로 설치한다.

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-2.webp" alt="Blender Preferences - Add-ons Install" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Blender에서 애드온 설치하기</p>
</div>

1. 화면 우측에서 Blender MCP를 켠다. 이것으로 모든 설정이 끝난다.

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-3.webp" alt="Blender MCP Enable" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Blender MCP 활성화</p>
</div>

2. Claude 데스크탑 앱에서 프롬프트를 입력하고, 수정을 반복하는 방식으로 모델링을 진행했다. 예시 이미지와 대체하고 싶은 모듈 이미지를 함께 제공하면 맥락을 더 잘 잡아준다.

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-4.webp" alt="Claude Desktop Prompt Example" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Claude에서 프롬프트 입력 예시</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-5.webp" alt="Blender Modeling Result 1" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">모델링 결과 1</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-6.webp" alt="Blender Modeling Result 2" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">모델링 결과 2</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-7.webp" alt="Blender Modeling Result 3" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">모델링 결과 3</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-8.webp" alt="Blender Modeling Result 4" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">모델링 결과 4</p>
</div>

이런 식으로 실무에 활용했다

Claude Code를 결제하기 전이었음에도 배경 포함 꽤 만족할 만한 퀄리티가 나왔다. 어쩌다 보니 기린이 완성됐지만, 이 글은 미감이나 Blender 사용법에 관한 포스팅이 아니니 MCP 활용 방법은 여기서 마친다.

어쩌다 보니 기린 완성된 느낌이지만, 미감이나 블렌더 툴 사용법에 관련된 포스트는 아니었으니 여기서 MCP 활용 방법은 마친다.

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-9.webp" alt="Final Giraffe Model" style="width: 20%; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">최종 완성된 기린 모델</p>
</div>

## 다음 프로젝트에 대해

현재 준비 중인 프로젝트를 간략히 소개한다.

이 작업은 세계 각지의 고양이 이미지를 모아 전시하는 것이 아니다. 서로 다른 지역의 시선들이 '고양이'라는 대상 위에 남긴 감각의 층을 드러내는 작업이다. 나는 고양이 애호가로서의 개인적 집착을 사적인 취향으로 숨기지 않고, 웹이라는 공적 공간에서 작동하는 관찰 장치로 전환한다.

이 프로젝트에서 고양이는 자연의 대상이 아니다. 인간의 돌봄과 소비, 애정과 통제 속에서 "애완화된 존재"로 재구성된 동물이다. 그 재구성의 결과를 비판적으로 고발하는 것이 목적이 아니라, 각각의 고양이가 인간과 함께 만들어진 미세한 형태로 존재한다는 사실을 기록하는 것이다. 따라서 이 작업은 고양이를 있는 그대로 보여주겠다는 약속이 아니다. 인간에 의해 대사된 동물성이 어떤 표정으로 남는지 끝까지 따라가는 시도다.

현재 Blender에서 시도하고 있는 작업은 다음과 같다.

1. 털실 뭉치가 구형으로 나타나도록 구성한다.
2. yarn, wool 소재에 약간의 furriness를 추가한다.
3. 가능하다면 세계 전도를 이미지로 매핑하여 털실 표면에 자연스럽게 묘사되도록 한다