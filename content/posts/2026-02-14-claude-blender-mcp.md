---
layout: post
title: "Controlling Blender with AI: Claude MCP Setup Guide (Mac)"
date: 2026-02-14 12:00:00 +0900
tags: [AI]
image: /claude-blender-mcp/claude-blender-mcp-1.webp
translationKey: "2026-02-09-claude-blender-mcp"
---

I previously used Claude + Blender MCP for production work while I was employed at a company. Recently, as I restarted a personal project, I rebuilt the same environment—and this time, I decided to document the process.

Most reference blogs are written for Windows setups, so this post is organized from the perspective of someone actually working on macOS, in a way that designers can realistically follow.

To be honest, I'm not particularly good at 3D modeling. Even creating a single object used to take me two or three full days, and scene-level work took much longer. This approach was something I tried to compensate for those limitations and produce results more quickly.

In the end, I was satisfied with the quality. That said, running Blender on a 2020 MacBook Pro still meant accepting significant slowdowns during work.

"MCP" may sound grand, but in practice it's simply a connection between an AI model and the 3D tool I already use. Compared to Adobe tools, Blender operates on a node-based system, which I found structurally more suitable for AI control.

The two resources I referred to most while writing this were:

https://github.com/ahujasid/blender-mcp

https://lightbakery.tistory.com/307

## Installation Order

1. Log in to the Claude desktop app.
2. Check the repository mentioned above:
https://github.com/ahujasid/blender-mcp

1. **Install uv (macOS equivalent of the Windows PowerShell step)**

Install `uv`. Without `uvx`, Claude cannot start the MCP server. Open Terminal and run:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

After installation, be sure to reload your shell:

```bash
source ~/.zshrc
```

1. Go back to Claude Desktop and click Settings → Developer in the top-left. A folder containing `claude_desktop_config.json` will open. If MCP is already configured, click "Edit Config."

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-1.webp" alt="Claude Desktop Settings - Developer" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Claude Desktop Developer Settings Screen</p>
</div>

1. Paste the following JSON:

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

1. Restart the app.
2. Download the Python addon file:
https://github.com/ahujasid/blender-mcp/blob/main/addon.py

1. In Blender, go to Edit → Preferences → Add-ons → Install and install it.

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-2.webp" alt="Blender Preferences - Add-ons Install" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Installing the addon in Blender</p>
</div>

1. Enable Blender MCP from the right-hand panel. That completes the setup.

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-3.webp" alt="Blender MCP Enable" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Enabling Blender MCP</p>
</div>

2. From there, I modeled by entering prompts in Claude Desktop and iterating through revisions. Providing both reference images and replacement module images helps the model understand context more accurately.

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-4.webp" alt="Claude Desktop Prompt Example" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Example prompt in Claude</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-5.webp" alt="Blender Modeling Result 1" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Modeling result 1</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-6.webp" alt="Blender Modeling Result 2" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Modeling result 2</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-7.webp" alt="Blender Modeling Result 3" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Modeling result 3</p>
</div>

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-8.webp" alt="Blender Modeling Result 4" style="width: 80%; min-width: 480px; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Modeling result 4</p>
</div>

This is roughly how I used it in production.

Even before subscribing to Claude Code, I was able to achieve fairly satisfying quality, including backgrounds. Somewhere along the way, I ended up with a giraffe—but since this post isn't about aesthetics or Blender techniques, I'll stop the MCP discussion here.

It feels like this turned into a giraffe project by accident, but again, this isn't about visual taste or Blender usage, so I'll wrap up the MCP portion at this point.

<div style="text-align: center; margin: 1rem 0;">
  <img src="/claude-blender-mcp/claude-blender-mcp-9.webp" alt="Final Giraffe Model" style="width: 20%; height: auto; display: block; margin: 0 auto;" />
  <p style="margin-top: 8px; font-style: italic; color: #666;">Final completed giraffe model</p>
</div>

## About the Next Project

Here's a brief introduction to what I'm currently preparing.

This project is not an exhibition of cat images collected from around the world. Instead, it aims to reveal the layered sensibilities that different regions project onto the subject of "cats." As a cat lover, I don't hide my personal fixation as a private preference—instead, I transform it into an observational apparatus operating within the public space of the web.

In this project, cats are not natural objects. They are animals reconstructed as "domesticated beings" through human care and consumption, affection and control. The goal is not to critically expose that reconstruction, but to record how each cat exists as a subtle form co-produced with humans. Therefore, this work does not promise to show cats "as they truly are." It is an attempt to follow, to the end, what kind of expression animality leaves behind after being metabolized by humans.

What I'm currently experimenting with in Blender is the following:

1. Configure a ball of yarn so it appears spherical.
2. Add slight furriness to yarn / wool materials.
3. If possible, map a world map image onto the yarn surface in a natural way.
