---
layout: post
title: "Crypto Article Week 1 | Coinbase Design System 요약하기"
date: 2025-12-31 12:00:00 +0900
tags: [Design System, UX, Crypto]
---

## 목차

1. [서론: 왜 디자인 시스템 먼저 분석하는가? 왜 Coinbase Design System을 먼저 선택했는가?](#서론-왜-디자인-시스템-먼저-분석하는가-왜-coinbase-design-system을-먼저-선택했는가)
2. [본문: 정체성과 대상 사용자](#본문--정체성과-대상-사용자)
   - 시스템의 공식 미션 / 슬로건
   - CDS, MUI, HIG 비교 분석
3. [시스템 아키텍처](#3-시스템-아키텍처)
   - Get Started에서 주목할 부분: Theming
   - Components
   - Hooks
4. [디자인 토큰 구조](#4-디자인-토큰-구조)
   - Primitive token과 Semantic token의 결합
   - 컬러 외 영역에서의 토큰 적용
   - Shadow 구조
5. [결론](#결론)

---

## 서론: 왜 디자인 시스템 먼저 분석하는가? 왜 Coinbase Design System을 먼저 선택했는가?

크립토 생태계에서 개발자가 아닌 디자이너로서 어떤 방식으로 기여할 수 있을지에 대해 오랫동안 고민해 왔다. 화면을 설계하는 역할에 머무르기보다는, 제품이 만들어지고 확장되는 과정 전반에서 어떤 지점에 개입할 수 있는지가 더 중요한 질문이 되었다. 그 과정에서 토큰 단위부터 컴포넌트까지 이어지는 디자인 시스템 구축 방식에 자연스럽게 관심이 옮겨갔다.

디자인을 기반으로 최근에는 웹사이트를 직접 만들며 개발 영역까지 함께 배우고 있다. 이 과정에서 디자이너와 프론트엔드 개발자가 어떤 방식으로 소통해야 협업 리소스를 최소화할 수 있는지에 대한 고민이 구체화되었다. 특히 AI 시대에 들어서며 Cursor, Antigravity, CLI와 같은 도구들이 디자이너와 프론트엔드 개발자의 역할을 대체할 수 있을 것이라는 이야기가 자주 언급되고 있다는 점도 이러한 고민을 가속시켰다. 나 역시 AI 대중화 이전과 이후를 비교했을 때, 맡게 되는 업무의 성격이 분명히 달라졌다고 느꼈다. 과거에는 ‘예쁘게 만드는’ 디자인 업무를 본업이나 외주 작업으로 주로 수행했다면, 최근에는 AI와 템플릿이 거의 모든 분야에 보편화되면서 그 역할만으로는 충분하지 않다고 느끼게 되었다. 대신 실물 작업을 기반으로 한 감각과 실전 경험을 바탕으로, 실제 상황에서 미감과 판단의 근거를 설명하고 선보일 수 있는 디자이너가 요구되고 있다는 인상을 받았다. 실무에서 중요하게 작동하는 것은 결과물보다도 사람들 사이에서 일이 흘러가는 방식에 대한 이해였다. 효율화된 프로세스를 알고 있고, 협업 과정에서 무엇이 병목이 되는지를 체감적으로 이해하고 있는 디자이너가 필요하다고 느꼈다. 디자이너의 언어로 비유하자면, 학부 시절 인쇄소에서 반복되는 수정과 꾸중을 거의 거치지 않고 작업을 마무리하는 것 처럼 해야지만 실무에서 필요로 하는 사람이 되어, 살아남을 수 있었다.

지금까지는 스타트업 환경에서 일해 왔기 때문에 디자인 시스템까지 체계적으로 정리하는 일은 종종 오버 엔지니어링처럼 느껴지기도 했다. 빠르게 결과를 만들어야 하는 상황에서는 개별 문제를 해결하는 것이 우선이었기 때문이다. 그러나 이직을 준비하는 지금의 입장에서는 판단이 달라졌다. 디자인과 프론트엔드 협업을 위한 가장 기본적인 판단 근거는 결국 디자인 시스템이라고 생각하게 되었다. 더 나아가 이를 문서 형태로 정리해 공개했다는 사실은, 내부 효율화를 넘어 잠재 사용자와 개발자의 사용 방식을 함께 고려한 결과라고 보았다. 이러한 이유로 공개된 디자인 시스템 문서 중에서도 크립토 산업을 대표하는 사례인 Coinbase Design System의 문서를 분석 대상으로 선택하게 되었다! 본 편인 개요를 포함해 디자인 - 개발 내용으로 이어지는 3부작을 목표로 한다.

## 본문 : 정체성과 대상 사용자

- **시스템의 공식 미션 / 슬로건**

CDS는 Introduction에서 다음과 같은 key features들을 제시한다.

비교를 위해 MUI와 HIG 문서 첫 페이지를 가져왔다.

|               | CDS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | MUI                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | HIG                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **제작사**    | Coinbase                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | Google                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | Apple                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **주요 특징** | • **Cross-platform** - CDS provides components for both React DOM and React Native. We go to great lengths to ensure that the source code is as identical as possible across React and React Native without compromising on platform-specific features.<br><br>• **Powerful theming** - The ThemeProvider can be used to define a custom theme for your application supporting light and dark mode.<br><br>• **Rich styling capabilities** - Components are designed to integrate with third-party libraries like styled-components, and to be customizable via theming, props, StyleProps, classnames, and inline styles.<br><br>• **Subcomponent composition** - Components are built using smaller subcomponents that can be fully customized or replaced via props.<br><br>• **Accessibility** - Components are accessible out of the box, and can be customized to different accessibility standards. | **Ship faster:** Over 2,500 open-source [**contributors**](https://github.com/mui/material-ui/graphs/contributors) have poured countless hours into these components. Focus on your core business logic instead of reinventing the wheel—we've got your UI covered.<br><br>**Beautiful by default:** We're meticulous about our implementation of [**Material Design**](https://m2.material.io/), ensuring that every Material UI component meets the highest standards of form and function, but diverge from the official spec where necessary to provide multiple great options.<br><br>**Customizability:** The library includes an extensive set of intuitive customizability features. [**The templates**](https://mui.com/store/) in our store demonstrate how far you can go with customization.<br><br>**Cross-team collaboration:** Material UI's intuitive developer experience reduces the barrier to entry for back-end developers and less technical designers, empowering teams to collaborate more effectively. The [**design kits**](https://mui.com/design-kits/) streamline your workflow and boost consistency between designers and developers.<br><br>**Trusted by thousands of organizations:** Material UI has the largest UI community in the React ecosystem. It's almost as old as React itself—its history stretches back to 2014—and we're in this for the long haul. You can count on the community's support for years to come (for example [**Stack Overflow**](https://trends.stackoverflow.co/?tags=material-ui)). | [**Hierarchy**](https://developer.apple.com/design/human-interface-guidelines#Hierarchy)<br>Establish a clear visual hierarchy where controls and interface elements elevate and distinguish the content beneath them.<br><br>[**Harmony**](https://developer.apple.com/design/human-interface-guidelines#Harmony)<br>Align with the concentric design of the hardware and software to create harmony between interface elements, system experiences, and devices.<br><br>[**Consistency**](https://developer.apple.com/design/human-interface-guidelines#Consistency)<br>Adopt platform conventions to maintain a consistent design that continuously adapts across window sizes and displays. |

**cds**

실사용 금융 제품에서 검증된 크로스 플랫폼(React·React Native) 컴포넌트 시스템으로, 소스 코드 일관성·강력한 테마 시스템·서브컴포넌트 교체가 가능한 높은 확장성을 통해 대규모 제품군의 UX 일관성과 개발 효율을 동시에 달성하는 실전형 디자인 시스템이다.

다른 디자인 시스템들과 마찬가지로 컴포넌트 조합 구조와 크로스 플랫폼 대응을 명시하고 있었으며, 그중에서도 상대적으로 기술 중심적인 성격이 두드러졌다. 세부 설명에서는 props나 ThemeProvider와 같은 개념을 직접적으로 언급하며, 디자인 문서 안에서 코드 레벨의 맥락까지 함께 전달하려는 의도가 드러났다.

크립토 트레이딩 거래소에서 출발한 배경 때문인지, 시각적 완성도보다도 고유 기능과 그 구현 방식을 우선적으로 다루고 있다는 인상을 받았다. 디자인 시스템이 UI 가이드라기보다는, 제품의 핵심 기능을 정확히 구현하기 위한 도구로 작동하고 있었다.

→ 프로덕션 환경에서 금융 제품을 운영·확장해야 하는 프론트엔드 개발자와 디자인 시스템 오너를 주요 독자로 설정했다. 디자인 가이드보다는 기능 구현과 코드 일관성을 중시하는 실무 중심 사용자층을 전제하고 있었다.

**Mui**

Material Design을 기반으로 한 범용 React UI 라이브러리로, 방대한 오픈소스 커뮤니티와 높은 커스터마이징 자유도를 통해 빠른 개발과 팀 간 협업을 지원하며, 다양한 프로젝트에 즉시 적용 가능한 표준 UI 인프라 역할을 수행한다.

MUI는 Collaboration, trusted by thousands of organizations와 같은 표현을 통해 조직 내부와 외부에서 쌓아온 신뢰를 전면에 내세우고 있었다. 시스템 자체의 완성도뿐 아니라, 이미 많은 팀과 조직에서 사용되고 있다는 사실이 하나의 설득 논리로 작동하고 있었다.

CDS가 기능과 소스 코드를 중심으로 설명을 전개하는 지점에서, MUI는 ‘diverge where necessary to provide multiple options’라는 문장을 통해 시각적 편의와 선택의 유연성을 함께 암시하고 있었다. 하나의 정답을 제시하기보다는, 상황에 따라 다른 선택이 가능하도록 여지를 남겨두는 태도가 인상적이었다.

→ 빠른 개발과 협업이 필요한 다양한 규모의 개발 팀과 프로덕트 팀 전반을 타겟으로 삼았다. 명확한 규범보다는 선택의 유연성과 사회적 검증을 중시하는 사용자층을 상정하고 있었다.

**HIG**

Apple 플랫폼 전반에 적용되는 디자인 원칙 문서로, 위계·조화·일관성을 중심으로 한 추상적이지만 강력한 기준을 제시하여, 디자이너와 개발자가 인터페이스를 설계할 때 사고의 기준점이 되는 철학적 프레임워크이다.

HIG는 세 시스템 중에서도 분량이 가장 짧았다. 애플의 자신감 때문인지, 혹은 운영체제 기반 디자인 시스템이 갖는 특성 때문인지는 모르겠다. 설명은 간결했지만, 디자인 철학은 오히려 가장 또렷하게 드러났다.

특히 Harmony라는 개념을 중심에 두고 있었는데, 이는 주로 조형 원리를 설명할 때 사용되는 용어라는 점에서 인상적이었다. 시각적 위계와 질서를 중시하는 태도 역시 명확하게 읽혔다. 플랫폼 컨벤션을 따른다고 명시하면서도, 최근 glassmorphism을 대대적으로 도입한 흐름을 보면, 세 시스템 중에서는 오히려 가장 비관습적인 선택을 하고 있는 사례로 보이기도 했다.

→ Apple 플랫폼 위에서 설계 판단을 내려야 하는 디자이너와 개발자를 주요 독자로 두었다. 구현 지침보다는 사고의 기준과 설계 철학을 필요로 하는 숙련된 사용자층을 전제하고 있었다.

---

## 3. 시스템 아키텍처

서론이 길었다. 이제부터는 Coinbase Design System을 중심으로 본격적인 구조 분석에 들어간다. Coinbase Design System의 전체 구조는 크게 세 영역으로 나뉜다. Get Started, Components, Hooks로 구성되며, Components 내부에는 더 세분화된 분류가 존재하지만 지면 관계상 최상위 구조만 정리한다.

```markdown
design-system/
├── get-started/
│ ├── introduction/
│ ├── installation/
│ ├── templates/
│ ├── theming/
│ ├── styling/
│ ├── playground/
│ └── ai-overview/
│
├── components/
│ ├── layout/
│ ├── typography/
│ ├── inputs/
│ ├── media/
│ ├── cards/
│ ├── data-display/
│ ├── feedback/
│ ├── overlay/
│ ├── navigation/
│ ├── graphs/
│ ├── numbers/
│ ├── animation/
│ └── other/
│
└── hooks/
├── useBreakpoints/
├── useDimensions/
├── useEventHandler/
├── useHasMounted/
├── useIsomorphicEffect/
├── useMediaQuery/
├── useMergeRefs/
├── usePreviousValue/
├── useRefMap/
├── useScrollBlocker/
├── useTheme/
└── useOverlayContentContext/
```

**Get Started에서 주목할 부분: Theming**

Get Started 섹션 중에서도 Theming은 디자인 시스템의 기초를 정의하는 영역이다. Color, Spacing, Border Radius, Icon Size, Avatar Size, Font Family·Size·Weight, Shadow 등 인터페이스를 구성하는 기본 단위들의 종류와 규격이 이곳에서 정리되어 있다. 개별 컴포넌트보다 앞서 시스템 전반에 적용되는 기준을 먼저 제시하는 구조다.

**Components**

Components는 UI 조립 단위를 중심으로 구성된 시스템의 핵심 영역이다. 반복적으로 사용되는 인터페이스 요소들을 일관된 규칙 아래 관리하기 위해 각 컴포넌트의 스펙을 정리하고 있다. 이러한 구성은 다른 디자인 시스템에서도 흔히 볼 수 있으며, 개인적으로는 Radix UI와 유사한 방향성을 선호한다.

다만 아쉬운 점은 접근성에 대한 기준이 목차 구조에서 명시적으로 드러나지 않는다는 점이다. Radix UI의 경우 접근성을 핵심 가치로 두고 ARIA, 포커스 관리, 키보드 인터랙션을 문서 전반에서 반복적으로 다룬다. 반면 CDS에서는 접근성과 관련된 개념이 독립된 카테고리나 명확한 진입점으로 나타나지 않는다.

**Hooks**

Hooks는 UI 요소가 아니라 행동과 상태를 다루는 로직 레이어를 담당한다. 이 영역은 이후 학습 과정을 정리해 별도의 편에서 다룰 예정이므로, 여기서는 구조적 의미에 집중한다.

UI와 로직을 분리해 디자인 시스템을 UI 키트가 아닌 프레임워크 단위로 다루려는 의도가 읽힌다. 이는 구현 과정에서의 효율성과 개발 속도 측면에서 분명한 장점으로 작용한다.

## 4. 디자인 토큰 구조

Theming에 정의된 `defaultTheme`를 기준으로 디자인 토큰의 구조와 특징을 살펴보았다. 전반적으로 눈에 띄는 점은 컴포넌트가 직접 값을 가지지 않고, 모든 시각적 속성이 토큰을 경유하도록 설계되어 있다는 점이다. 각 요소가 어떤 방식으로 분리되어 있는지 순서대로 정리한다.

### Primitive token과 Semantic token의 결합

Primitive token은 물리적 규칙에 따라 분류된 값의 집합이다. 예를 들어 색상 토큰은 `--light-blue0`부터 `--light-blue100`, `--dark-gray0`부터 `--dark-gray100`까지 스펙트럼 단위로 촘촘히 나뉘어 있다. 이 단계의 토큰에는 사용 맥락이나 의미가 부여되지 않으며, 버튼이나 배경과 같은 역할 정보도 포함되지 않는다. 이 구조는 팔레트 수정이나 테마 전환 시, 시스템 전반에 영향을 주지 않고 기반 색상 체계만 교체할 수 있게 한다.

<img src="/crypto-article-1-img1.png" alt="Primitive token 색상 팔레트: Blue, Green, Orange 각각 11단계 색상 스펙트럼" style="width: 100%; min-width: 600px; height: auto; display: block; text-align: left;" />

반면 Semantic token은 사용 규칙과 의미를 정의한다. `fgPrimary`와 같은 토큰은 브랜드나 주요 액션을 나타내는 텍스트 색이라는 역할을 가지며, 실제 값이 어떤 색인지는 중요하지 않다. 이로 인해 컴포넌트 레벨에서는 특정 색상 값을 직접 참조하지 않고, 의미 기반 토큰만을 사용하게 된다.

<img src="/crypto-article-1-img2.png" alt="Semantic token 색상: FG, FGMUTED, FGINVERSE, FGPRIMARY, FGWARNING, FGPOSITIVE, FGNEGATIVE, BG, BGALTERNATE" style="width: 100%; min-width: 600px; height: auto; display: block; text-align: left;" />

간단한 스크립트를 통해 토큰 구조를 확인한 결과, Light와 Dark를 통틀어 총 110개의 semantic token이 primitive token을 기반으로 구성되어 있었다. 예를 들어 `--lightColor-bg`와 `--darkColor-bg`는 모두 기본 배경이라는 동일한 의미를 가지지만, 각각 다른 primitive 값과 연결된다. 이 구조는 새로운 모드 추가나 테마 확장 시 컴포넌트 수정 없이 토큰 레벨에서 대응할 수 있게 만든다. 테마 확장은 UI 수정 작업이 아니라 데이터 교체 작업이 된다.

<img src="/crypto-article-1-img3.png" alt="Dark mode semantic token 매핑 테이블: --darkColor-fgMuted, --darkColor-fgPrimary, --darkColor-fgPositive, --darkColor-fgNegative, --darkColor-fgWarning, --darkColor-bg" style="width: 100%; min-width: 600px; height: auto; display: block; text-align: left;" />

### 컬러 외 영역에서의 토큰 적용

이러한 결합 구조는 컬러 외 영역에도 동일하게 적용된다. Spacing 토큰은 8px 기반 스케일을 중심으로 하면서, `2px`, `4px`, `6px`, `12px`와 같은 보조 단위를 함께 사용한다. 고정된 그리드와 미세 조정이 동시에 가능한 구조다.

Typography는 이 테마에서 가장 정제된 영역 중 하나로 보인다. Font family, size, weight, line-height, transform이 각각 분리된 토큰으로 관리되며, Display, Title, Headline, Body, Label, Caption, Legal로 명확한 위계를 가진다. 데이터와 금융 UI에 대응하기 위한 Mono 계열도 별도로 정의되어 있다. `fontFamily-display`, `fontSize-title`, `lineHeight-body`와 같이 역할 기반 네이밍이 이미 적용되어 있다는 점이 구조적 완성도를 높인다.

다만 Typography 역시 컬러와 마찬가지로 Light와 Dark에 따른 semantic override 구조가 분리되어 있지 않다. 다크 모드에서 label이나 caption의 대비 전략은 토큰 레벨에서는 드러나지 않는다.

### Shadow 구조

Shadow는 `elevation1`, `elevation2` 두 단계만 정의되어 있다. 정보 밀도가 높은 금융·트레이딩 UI에서 과도한 입체 효과를 제한하려는 설계 의도가 읽힌다. 다만 최근 UI 트렌드에서 자주 사용되는 다층적 shadow 표현과는 거리가 있다.

## 결론

Coinbase Design System은 컴포넌트보다 토큰과 구조를 우선시하며, UI를 시각적 결과물이 아닌 데이터와 규칙의 집합으로 다룬다. 컴포넌트는 시각적 결과물이 아니라 토큰과 로직 위에 얹히는 결과로 취급되고 있었다. 이런 접근을 통해 디자인 시스템을 통해 구현 효율과 확장성을 동시에 확보하려는 의도가 구조 전반에 반영되어 있었다. 금융 제품이라는 도메인 안에서 안정성과 확장성을 동시에 다루기 위해 어떤 선택들이 이루어졌는지도 비교적 명확하게 드러났다.
