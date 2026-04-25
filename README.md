# Isometric Godot Project

![preview](https://github.com/NicoRuedaA/Isometric_Godot/blob/main/preview.gif?raw=true)

This is a 2D isometric project developed in **Godot Engine 3.x**.

## Main Features

- **Engine:** Godot Engine 3 (GDScript).
- **Visual Style:** 2D Isometric.
- **Main Scene:** `HUD_PRINCIPAL.tscn` (Located in `Escena/Olaia/`).
- **Included Systems:**
  - Save system (`save.gd`).
  - Configurable global settings.
  - Abilities (`Hability` base in GDScript).

## Input Mappings

The project includes the following mapped actions:

- **Select:** Left Click
- **Zoom:** Mouse Wheel (`zoom_in`, `zoom_out`)
- **Pause:** `Escape`
- **Mouse Interactions:** Left Click and Right Click

## Directory Structure

- `/Escena`: Contains all game scenes (HUD, Levels, etc).
- `/Script`: Game logic in GDScript (including abilities and behaviors).
- `/Sprite`: Graphic resources and spritesheets.
- `/fuentes`: Custom fonts used in the game.
- `/DEMOS`: Demo or prototyping scenes and scripts.
- `/PDF` and `/Explicacion`: Additional documentation and design documents.

## How to Run

1. Open **Godot Engine 3**.
2. Import the `project.godot` file.
3. Click "Run" or press `F5` to launch the main scene (`HUD_PRINCIPAL.tscn`).