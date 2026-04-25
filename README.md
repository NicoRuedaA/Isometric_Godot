# Isometric 2D Game

[![Godot](https://img.shields.io/badge/Godot-3.x-blue?logo=godot-engine)](https://godotengine.org/)
[![GDScript](https://img.shields.io/badge/Language-GDScript-478CBF)](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
[![Status](https://img.shields.io/badge/Status-Prototype-orange)]()

![preview](docs/preview.gif)

This is a 2D isometric project developed in **Godot Engine 3.x**.

---

## Features

- **Isometric grid** — 2D isometric camera and tilemap setup
- **Grid-based movement** — tile-by-tile player movement on the isometric plane
- **Save system** — persistent game state via `save.gd`
- **Ability framework** — extensible `Hability` base class in GDScript
- **Zoom controls** — mouse wheel zoom in/out
- **Custom fonts and sprites** — hand-picked visual assets

---

## Project Structure
├── Escena/          # Game scenes (HUD, levels)
├── Script/          # GDScript logic — movement, abilities, save system
├── Sprite/          # Spritesheets and graphic assets
├── fuentes/         # Custom fonts
├── DEMOS/           # Prototype and reference scenes
├── PDF/             # Design documentation
├── Explicacion/     # Additional notes and explanations
└── project.godot    # Godot project entry point

---

## Controls

| Input | Action |
|---|---|
| Left Click | Select |
| Mouse Wheel | Zoom in / out |
| Escape | Pause |

---

Developed by [Nico Rueda](https://github.com/NicoRuedaA)
