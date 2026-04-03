extends "res://Script/Grid_father.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	pass

# Called when the node enters the scene tree for the first time.
func print_cell(cell,tile):
	set_cellv(cell, tile)


func clear_cell(cell):
	set_cellv(cell, EMPTY)
