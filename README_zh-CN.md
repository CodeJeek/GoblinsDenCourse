# Goblins Den Course（哥布林巢穴·学习项目）

**English** · [中文 (简体)](README_zh-CN.md)

跟随 Godot 教程写的一个练习项目 —— 用构建小型地牢探索游戏的方式学习 3D 第一人称游戏开发。目前包含一个可游玩的教程关卡：第一人称控制器、几个模块化地牢房间、自动生成的天花板，以及用 Blender 建模的地牢方块。

> 只是学习项目 —— 主要跟着教程敲的代码，不是完整的正式游戏。

## 当前包含的内容

- **第一人称控制器** —— `CharacterBody3D`，带鼠标视角、`WASD` 移动、冲刺和跳跃
- **模块化房间** —— `entrance`（入口）/ `corridor`（走廊）/ `hall_t`（T 形大厅）预制体，由 `GridMap` 方块拼成，组装成教程关卡
- **自动生成天花板** —— `room.gd` 根据地面方块自动补齐天花板，自动跳过孔洞与开口
- **Blender → Godot 资产管线** —— 地牢方块在 Blender 中建模，导出 GLB 后打包成 `MeshLibrary` 资源
- **Git 插件** —— 通过 `godot-git-plugin` 插件在编辑器内做版本管理

## 操作说明

| 动作 | 按键 |
| --- | --- |
| 移动 | `W` `A` `S` `D` |
| 冲刺 | `Shift` |
| 跳跃 | `Space` |
| 视角 | 鼠标（捕获模式） |
| 释放 / 捕获鼠标 | `Esc` |

`use`（`E`）、`kick`（`F`）、`action`（左键）、`block`（右键）这些输入动作已在 `project.godot` 中配置好，但对应的功能还没有实现。

## 快速开始

1. 安装 [Godot 4.7+](https://godotengine.org/)（项目使用 **Forward Plus** 渲染 + **Jolt Physics** 物理引擎）。
2. 克隆本仓库，在编辑器中打开 `project.godot`。
3. 按 **F5** 运行教程关卡。

## 项目结构

```
GoblinsDenCourse/
├── actors/player/        # 第一人称玩家控制器
├── addons/godot-git-plugin
├── assets/               # Blender 源文件、GLB 方块、MeshLibrary、纹理
├── game/                 # 主场景（天空、光照、世界）
├── interface/            # CanvasLayer UI（准星光标）
├── levels/               # 关卡基类 + 教程关卡
├── rooms/                # 可复用房间预制体（入口 / 走廊 / T 形大厅）
└── project.godot
```

## 开源协议

[GPL-3.0](LICENSE)
