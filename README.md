# Goblins Den Course

**English** · [中文 (简体)](README_zh-CN.md)

A practice project following a Godot tutorial — learning 3D first-person game development by building a small dungeon crawler. Right now it's a single playable tutorial level: an FPS controller, a few modular dungeon rooms, auto-generated ceilings, and dungeon tiles modeled in Blender.

> Just a learning project — mostly following along with a course, not a finished game.

## What's in it

- **First-person controller** — a `CharacterBody3D` with mouse-look, `WASD` movement, sprint, and jump
- **Modular rooms** — `entrance` / `corridor` / `hall_t` prefabs made of `GridMap` tiles, assembled into the tutorial level
- **Auto-generated ceilings** — `room.gd` fills in ceilings based on floor cells, skipping holes and openings
- **Blender → Godot asset pipeline** — dungeon tiles modeled in Blender, exported to GLB, and packed into `MeshLibrary` resources
- **Git plugin** — `godot-git-plugin` addon for version control inside the editor

## Controls

| Action | Key |
| --- | --- |
| Move | `W` `A` `S` `D` |
| Sprint | `Shift` |
| Jump | `Space` |
| Look around | Mouse (captured) |
| Release / capture cursor | `Esc` |

The input actions `use` (`E`), `kick` (`F`), `action` (LMB) and `block` (RMB) are already mapped in `project.godot`, but no corresponding mechanics are implemented yet.

## Getting started

1. Install [Godot 4.7+](https://godotengine.org/) (project uses **Forward Plus** + **Jolt Physics**).
2. Clone the repo and open `project.godot` in the editor.
3. Press **F5** to run the tutorial level.

## Structure

```
GoblinsDenCourse/
├── actors/player/        # First-person player controller
├── addons/godot-git-plugin
├── assets/               # Blender source, GLB tiles, MeshLibrary, textures
├── game/                 # Main scene (sky, lighting, world)
├── interface/            # CanvasLayer UI (crosshair cursor)
├── levels/               # Level base + tutorial level
├── rooms/                # Reusable room prefabs (entrance / corridor / hall_t)
└── project.godot
```

## License

[GPL-3.0](LICENSE)
