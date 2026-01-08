---
layout: post
title: "Crypto Article Week 2.5 | 이 프로젝트는 돈을 벌어주지 않는다"
date: 2026-01-07 12:00:00 +0900
tags: [Crypto, SwiftUI, macOS, App]
---

## **Mac OS 사용자를 위한 실시간 토큰 가격 바**

크립토는 구조적으로 지속적인 자본 유입이 있어야만 유지된다. 그래서 유저 유입이 중요해지고, 종종 팀의 펀더멘털보다 얼마나 많이 노출되었는지가 더 큰 영향을 미친다. 트레이딩 사용자들은 에어드랍으로 온체인에 들어온 뒤 선물 DEX, 예측시장 등으로 영역을 넓혀가며 더 많은 자극을 찾는다. 도파민을 줄 수 있는 장치에 대한 수요가 늘어나고, 이에 따라 이를 제공하는 서비스들도 계속해서 등장한다.

그러다 시장이 꺾인다. 비트를 시작으로 대부분의 토큰이 하락하고, 온체인이든 CEX든 코인이 더 이상 재미있지 않다. 베어장에서는 무엇을 해도 수익이 나지 않는다. 사용자는 떠나고, 남는 건 조용한 차트뿐이다.

이럴 때 필요한 건 액션이 아니라 ‘머무를 이유’라고 생각했다. 지금은 유입보다 이탈을 늦추는 쪽에 무게를 두어야 한다. 어차피 돌아올 사용자들이라면 그들의 관심이 완전히 떠나지 않도록 프로덕트가 옆에 남아 있는 것이 중요하다. 시장이 멈춰 보이는 이 시기에도 무언가는 계속해서 움직이고 있다는 것을, 조용히 상기시켜주는 도구가 필요했다.

그래서 만들었다. macOS 메뉴바에서 실시간으로 암호화폐 가격을 보여주는 앱이다. BTC, ETH, USDT뿐 아니라 상위 10개 토큰을 지원하며, USDT와 USDC의 김치프리미엄과 스프레드도 계산해 표시한다. 사용자는 최소 1개에서 최대 3개의 토큰을 메뉴바에 고정하거나, 전체 토큰을 3초 간격으로 순환 표시하는 모드를 선택할 수 있다. 가격은 2분마다 자동으로 갱신되며, 변화 방향은 화살표와 색상으로 나타난다. 단순한 도구지만, 조용히 시장의 움직임을 곁에 두고 싶은 사람을 위한 제품이다.

돈을 만들 목적으로 시작한 서비스는 아니다. 하지만 토큰이라는 금융 구조를 실시간 데이터로 감각화하는 방식에 대해 고민한 결과물을 만들고 싶었다. 시장 상황과 관계 없이 이 제품은 여전히 열려 있기를 바란다.

**GitHub Repository:** <br>
[https://github.com/HJKUNST/crypto-signal-menubar](https://github.com/HJKUNST/crypto-signal-menubar)

<div style="text-align: center; margin: 1rem 0;">
  <img src="/mac-token-price-bar-menubar.png" alt="macOS 메뉴바에 표시되는 실시간 암호화폐 가격 (BTC, ETH, USDT)" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">메뉴바에 실시간으로 표시되는 암호화폐 가격과 변동 방향 (상승/하락 화살표).</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/mac-token-price-bar-menu.png" alt="macOS 메뉴바 암호화폐 가격 트래커 드롭다운 메뉴" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">메뉴바 드롭다운에서 실시간 암호화폐 가격과 변동률을 확인할 수 있다.</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/mac-token-price-bar-display-mode.png" alt="Display Mode 설정: Pinned Mode와 Auto Mode (Carousel) 옵션" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Display Mode에서 Pinned Mode(고정 모드) 또는 Auto Mode(자동 순환 모드)를 선택할 수 있다.</p>
</div>
