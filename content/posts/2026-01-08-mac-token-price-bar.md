---
layout: post
title: "Crypto Article Week 2.5 | This Project Doesn't Make Money"
date: 2026-01-07 12:00:00 +0900
tags: [Crypto, SwiftUI, macOS, App]
translationKey: "2026-01-08-mac-token-price-bar"
aliases:
  - /posts/2026-01-08-mac-token-price-bar/
---

## **A Real-Time Token Price Bar for macOS Users**

Crypto is structurally dependent on a continuous inflow of capital to sustain itself. That is why user acquisition matters so much, and often, how much exposure a project gets has a greater impact than the team's fundamentals. Trading users typically enter on-chain through airdrops, then expand into futures DEXs, prediction markets, and other areas in search of more stimulation. Demand for dopamine-inducing mechanisms grows, and services that provide them continue to emerge.

Then the market turns. Starting with Bitcoin, most tokens decline, and whether on-chain or on CEXs, crypto stops being fun. In a bear market, nothing seems to generate returns. Users leave, and all that remains are quiet charts.

In times like these, I believed what was needed was not action, but a reason to stay. The focus should shift from attracting new users to slowing down the departure of existing ones. If they are users who will eventually return, it is important for the product to remain by their side so that their attention never fully drifts away. Even in this period when the market appears to have stopped, something is still moving — and I needed a tool that would quietly remind them of that.

So I built one. It is an app that displays real-time cryptocurrency prices in the macOS menu bar. It supports not only BTC, ETH, and USDT but also the top 10 tokens, and it calculates and displays the Kimchi premium and spread for USDT and USDC. Users can pin a minimum of 1 and a maximum of 3 tokens to the menu bar, or choose a mode that cycles through all tokens at 3-second intervals. Prices are automatically refreshed every 2 minutes, and the direction of change is indicated by arrows and colors. It is a simple tool, but it is a product made for those who want to quietly keep the pulse of the market by their side.

This was not a service started with the goal of making money. However, I wanted to create something born out of thinking about how to make the financial structure of tokens tangible through real-time data. Regardless of market conditions, I hope this product remains open.

**GitHub Repository:** <br>
[https://github.com/HJKUNST/crypto-signal-menubar](https://github.com/HJKUNST/crypto-signal-menubar)

<div style="text-align: center; margin: 1rem 0;">
  <img src="/mac-token-price-bar/mac-token-price-bar-menubar.png" alt="macOS 메뉴바에 표시되는 실시간 암호화폐 가격 (BTC, ETH, USDT)" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Real-time cryptocurrency prices and trend direction (up/down arrows) displayed in the menu bar.</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/mac-token-price-bar/mac-token-price-bar-menu.png" alt="macOS 메뉴바 암호화폐 가격 트래커 드롭다운 메뉴" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">View real-time cryptocurrency prices and percentage changes from the menu bar dropdown.</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/mac-token-price-bar/mac-token-price-bar-display-mode.png" alt="Display Mode 설정: Pinned Mode와 Auto Mode (Carousel) 옵션" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">In Display Mode, you can choose between Pinned Mode (fixed tokens) or Auto Mode (carousel rotation).</p>
</div>
