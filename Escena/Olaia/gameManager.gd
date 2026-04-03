
extends Node2D

enum {EMPTY=-1, MOVEMENT=0, ATTACK}

onready var grid = $fichas
onready var area_cell_clicked = $clicked
var pawn_clicked 

var ready

func _ready():
	ready = false


	

#Click
func _input(event):
	if(!ready):
		if event is InputEventMouseButton:
			var cell_Position =  get_global_mouse_position()
			var x = grid.get_cell_clicked(cell_Position)
			area_cell_clicked.global_position = x
			
	
	
#Obtenemos jugador clickado
func _on_clicked_area_entered(area):
	pawn_clicked = area.get_parent()
	print(pawn_clicked.m_is_clicked)
	if(pawn_clicked.is_in_group("pawn") and pawn_clicked.m_is_clicked == false):
		set_grid_range_movement(pawn_clicked)
		pawn_clicked.m_is_clicked = true
		ready=true

#Dibujamos rango	
func set_grid_range_movement(pawn):
	grid.draw_range(pawn.m_move_range, pawn.m_actual_cell, MOVEMENT)
	
func ready():
	ready=false
	print(ready)
	
	


