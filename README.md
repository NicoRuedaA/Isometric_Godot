# Isometric Godot Project

![](https://github.com/NicoRuedaA/Isometric_Godot/blob/main/preview.gif?raw=true)

Este es un proyecto 2D isométrico desarrollado en **Godot Engine 3.x**. 

## Características principales

- **Motor:** Godot Engine 3 (GDScript).
- **Estilo Visual:** Isométrico 2D.
- **Escena Principal:** `HUD_PRINCIPAL.tscn` (Ubicada en `Escena/Olaia/`).
- **Sistemas incluidos:**
  - Sistema de guardado (`save.gd`).
  - Ajustes globales configurables.
  - Habilidades (`Hability` base en GDScript).

## Controles configurados

El proyecto cuenta con las siguientes acciones mapeadas:

- **Seleccionar:** Click Izquierdo
- **Zoom:** Rueda del ratón (`zoom_in`, `zoom_out`)
- **Pausa:** `Escape`
- **Interacciones de ratón:** Click Izquierdo y Click Derecho

## Estructura de Directorios

- `/Escena`: Contiene todas las escenas del juego (HUD, Niveles, etc).
- `/Script`: Lógica del juego en GDScript (incluyendo habilidades y comportamientos).
- `/Sprite`: Recursos gráficos y spritesheets.
- `/fuentes`: Fuentes personalizadas utilizadas en el juego.
- `/DEMOS`: Escenas o scripts de demostración o prototipado.
- `/PDF` y `/Explicacion`: Documentación adicional y documentos de diseño del proyecto.

## Cómo ejecutarlo

1. Abre **Godot Engine 3**.
2. Importa el archivo `project.godot`.
3. Haz clic en "Ejecutar" o presiona `F5` para lanzar la escena principal (`HUD_PRINCIPAL.tscn`).
