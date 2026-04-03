extends "res://Script/Grid_father.gd"

onready var ranges = $rangos
onready var game_manager = get_parent()
onready var tablero = get_parent().get_node("tablero")

export(Array, PackedScene) var sets = [
	preload("res://Escena/equipos/equipoMuerte.tscn"),
	preload("res://Escena/equipos/equipoMonkey.tscn"),
	preload("res://Escena/equipos/equipoVerde.tscn"),
	preload("res://Escena/equipos/equipoOriginal.tscn")
]

var set_player1 = sets[int(GlobalSettings.set_player_1)]
var set_player2 = sets[int(GlobalSettings.set_player_2)]

var player1 
var player2

var mouse_position

func _ready():

	var player1_set = set_player1.instance()
	var player2_set = set_player2.instance()
	add_child(player1_set)
	add_child(player2_set)
	
	player1_set.name = "1"
	player1_set.position = Vector2(0, 0)
	player2_set.name = "2"
	player2_set.position = Vector2(0, 0)
	
	
	player1 = $"1"
	player2 = $"2"
	
	var xCell = -4
	var yCell = -3
	
	
	
	
	for i in player2.get_children():
		xCell+=1
		i.setup(self, game_manager)
		i.set_to_cell(xCell, yCell)
		i.connect("on_death", game_manager, "_on_actor_death")
	xCell = -4
	yCell = 4
	for i in player1.get_children():
		xCell+=1
		i.setup(self, game_manager)
		i.set_to_cell(xCell, yCell)
		i.connect("on_death", game_manager, "_on_actor_death")


func worldToMap(vec):
	return world_to_map(vec)
	
func mapToWorld(vec):
	return map_to_world(vec)

func cartesianToIsometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y)/2)
	
func isometricToCartesian(iso):
	var cartesian = Vector2((iso.x + iso.y * 2)/2,  -iso.x + (iso.x + iso.y * 2)/2)
	return cartesian


func prepare_movement(pawn):
	draw_range(pawn.m_move_range , world_to_map(pawn.position), MOVEMENT)
	
func prepare_attack(pawn, hability):
	draw_range(pawn.m_move_range, world_to_map(pawn.position), EMPTY)
	draw_range(hability.hability_range, world_to_map(pawn.position), ATTACK)
	pawn.m_is_clicked=true


func get_pawn_at_cell(cell: Vector2):
	if player1:
		for i in player1.get_children():
			if i.m_actual_cell == cell:
				return i
	if player2:
		for i in player2.get_children():
			if i.m_actual_cell == cell:
				return i
	return null

func request_move(pawn, direction):
	if not(pawn.m_attacking):
		#print("lllama a la funcion moueve ese culardo")
		var cell_start = world_to_map(pawn.position)
		var cell_target = worldToMap(to_local(direction))
		var a = get_action_values(direction)
		var b = a[0]
		var c = a[1]
		#obtenemos si hay alguna pieza en la casilla clickada
		var cell_target_type_pawn = get_cellv(cell_target)
		#obtenemos si la casilla clickada está en el rango dibujadi
		var cell_target_type = ranges.get_cellv(cell_target)
		
		match cell_target_type:
			#si la casilla seleccionada no tiene color
			ranges.EMPTY:
				pawn.m_is_clicked = false
				set_cellv(cell_start, pawn.m_cell_player)
				game_manager.request_end_turn(false)
				draw_range(pawn.m_move_range, cell_start, EMPTY)
			#si la casilla seleccionada es amarilla
			ranges.MOVEMENT:
				if(cell_target_type_pawn==-1 and cell_start!=cell_target):
					pawn.position = c
					pawn.m_actual_cell = b
					pawn.flip_sprite(cell_start.x - cell_target.x > 0)
					set_cellv(cell_start, -1)
					set_cellv(cell_target, pawn.m_cell_player)
					pawn.m_is_clicked = false
					yield(get_tree().create_timer(0.1), "timeout")
					if not is_instance_valid(pawn):
						return
					game_manager.request_end_turn(true)
					draw_range(pawn.m_move_range, cell_start, EMPTY)
				elif(cell_start!=cell_target):
					game_manager.set_cell_clicked(worldToMap(cell_target))
					pawn.m_is_clicked = false
					set_cellv(cell_start, pawn.m_cell_player)
					yield(get_tree().create_timer(0.1), "timeout")
					if not is_instance_valid(pawn):
						return
					game_manager.request_end_turn(false)
					draw_range(pawn.m_move_range, cell_start, EMPTY)
					



func request_attack(pawn, hability , direction):
	if(pawn.m_attacking):
		#print("llama a la funcion de atacar")
		var cell_start = world_to_map(pawn.position)
		var cell_target = worldToMap(to_local(direction))
		var a = get_action_values(direction)
		var b = a[0]
		var c = a[1]
		var cell_target_type_pawn = get_cellv(cell_target)
		var cell_target_type = ranges.get_cellv(cell_target)
		match cell_target_type:
			#si la casilla seleccionada no tiene color
			ranges.EMPTY:
				draw_range(hability.hability_range, cell_start, EMPTY)
				#draw_range(pawn.m_move_range, cell_start, MOVEMENT)
				yield(get_tree().create_timer(0.5), "timeout")
				if not is_instance_valid(pawn):
					return
				pawn.m_attacking=false
				yield(get_tree().create_timer(0.1), "timeout")
				game_manager.request_end_turn(false)
				#pawn.m_attacking = false
			#si la casilla seleccionada es de atacar
			ranges.ATTACK:
				#obtener pieza enemiga
				#var pawn_objective = ..
				if(cell_target_type_pawn!=-1 and cell_start!=cell_target):
					pawn.m_attacking=false
					pawn.m_is_clicked = false
					yield(get_tree().create_timer(0.35), "timeout")
					if not is_instance_valid(pawn):
						return
					game_manager.request_end_turn(true)
					
					var pawn_target = get_pawn_at_cell(cell_target)
					if pawn_target:
						pawn_target.get_damage(pawn.m_actual_attack)
					yield(get_tree().create_timer(0.3), "timeout")
					if not is_instance_valid(pawn_target):
						# Si el objetivo murió antes, limpiamos la celda usando la celda calculada anterior
						set_cellv(world_to_map(cell_target), -1)
					else:
						set_cellv(world_to_map(pawn_target.position), -1)
					
					draw_range(pawn.m_move_range, cell_start, EMPTY)
					draw_range(hability.hability_range, cell_start, EMPTY)
					
					
					yield(get_tree().create_timer(0.35), "timeout")
					if not is_instance_valid(pawn):
						return
					game_manager.set_cell_clicked(worldToMap(cell_target))
				pawn.m_attacking=false
		
					#pawn.m_is_clicked = false
					#yield(get_tree().create_timer(0.1), "timeout")
					#game_manager.request_end_turn(false)
					#draw_range(pawn.m_move_range, cell_start, EMPTY)
					
				#yield(get_tree().create_timer(0.1), "timeout")
				#game_manager.request_end_turn(true)
		
		

func get_cell_clicked(dir):
	var a = worldToMap(mapToWorld(to_local(dir)))
	var b = world_to_map(a)
	var c = map_to_world(b)
	return to_global(c)
	

func get_action_values(dir):
	var a = worldToMap(mapToWorld(to_local(dir)))
	var b = world_to_map(a)
	var c = map_to_world(b)
	
	return [b, c]
	

func draw_range(move_range, actual_cell, tile):

	var cells_to_draw = []
	var initial_cell = Vector2(actual_cell.x - move_range, actual_cell.y + move_range)
	
	var x = move_range
	var y = move_range
	
	var cell_target_type
	var cell_target
	
	for i in range (move_range*2 + 1):
		
		for j in range (move_range*2 + 1):
			cell_target = Vector2(actual_cell.x - x, actual_cell.y + y)
			cell_target_type = tablero.get_cellv(cell_target)
			#cell_target_type != -1 and 
			if(cell_target_type==MOVEMENT or cell_target_type==ATTACK):
				ranges.print_cell(cell_target, tile)
			
			y-=1
		x-=1
		y = move_range
		
		

func set_size():
	return cell_size

		
	

		
		
		



