extends Node2D


enum {EMPTY=-1, MOVEMENT=0, ATTACK}


onready var grid = $fichas
onready var area_cell_clicked = $clicked

#pieza seleccionada
var pawn_clicked 
#gestion de turnos
var thinking setget set_thinking
var active_player : int = 1

signal thinking_changed(is_thinking)
signal pawn_selected(pawn)

func set_thinking(value):
	thinking = value
	emit_signal("thinking_changed", thinking)




func _ready():
	self.thinking = false
	
#Click
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if Input.is_action_pressed("left_click"):
			var cell_Position =  get_global_mouse_position()
			if(!self.thinking):
				var x = grid.get_cell_clicked(cell_Position)
				area_cell_clicked.global_position = x
			else:
				if pawn_clicked != null:
					if(pawn_clicked.m_is_clicked and not pawn_clicked.m_attacking):
						grid.request_move(pawn_clicked, cell_Position)
					elif(pawn_clicked.m_is_clicked and pawn_clicked.m_attacking):
						grid.request_attack(pawn_clicked, pawn_clicked.m_actual_attack, cell_Position)


#Obtenemos jugador clickado
func _on_clicked_area_entered(area):
	pawn_clicked = area.get_parent()
	if(pawn_clicked.is_in_group("pawn") and 
	pawn_clicked.m_is_clicked == false and 
	int(pawn_clicked.get_parent().name) == active_player):
		pawn_clicked.clicked()
		emit_signal("pawn_selected", pawn_clicked)
		self.thinking=true
		
		
#cuando atacamos, no cambiamos la celda seleccionada (logica de juego)
func set_cell_clicked(cell):
	area_cell_clicked.global_position = cell
	

func get_pawn_clicked():
	return pawn_clicked


#						****GESTION DE TURNOS****
func request_end_turn(turn_ended):

	self.thinking=false
	if(turn_ended):
		end_turn()
		
func end_turn():
	active_player=2 if active_player==1 else 1

#				******INPUT******


func _on_Attack_pressed():
	if(pawn_clicked != null):
		pawn_clicked.attack()
#func _on_Button_pressed():
	#if(pawn_clicked != null):
		#pawn_clicked.attack()
		
func _on_actor_death(actor):
	if(actor.is_boss):
		if actor.team == 2:
			GlobalSettings.winner = "player 1" 
			GlobalSettings.loser = "player 2" 
		else:
			GlobalSettings.winner = "player 2" 
			GlobalSettings.loser = "player 1" 
		get_tree().change_scene("res://Escena/Olaia/result.tscn")

func go_to_menu():
	get_tree().change_scene("res://Escena/Olaia/HUD_PRINCIPAL.tscn")
	get_tree().paused = false
		
		

