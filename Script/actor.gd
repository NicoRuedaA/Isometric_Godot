extends "res://Script/pawn.gd"

#3 jugador 1, 4 jugador 2, 2 clickeado

var Grid
var gameManager

var cellSize = Vector2.ZERO
onready var habilities_tree = $habilities

export var m_move_range = 2
export var m_health = 1

var m_actual_cell
var m_cell_player

#estados de la pieza

var m_is_clicked
var m_attacking
var m_actual_attack

func setup(grid_ref, gm_ref):
	Grid = grid_ref
	gameManager = gm_ref
	if Grid:
		cellSize = Grid.set_size()

signal on_death(actor)

export var is_boss : bool = false
export var team : int = 0

func _ready():
	if team == 0 and get_parent():
		team = int(get_parent().name) if get_parent().name in ["1", "2"] else 1
	if not is_boss and name == "jefe":
		is_boss = true
		
	m_is_clicked = false
	m_attacking = false
	
	if(!is_boss):
		m_cell_player = 3 if team == 1 else 4
	else:
		m_cell_player = 15 if team == 1 else 14
	m_actual_attack=habilities_tree.m_habilities[0]
	
	
	
	
func _input(event):

	if event is InputEventMouseButton:
		if Input.is_action_pressed("left_click"):
			if(m_is_clicked and not m_attacking):
				var toMove =  get_global_mouse_position()
				Grid.request_move(self, toMove)
			if(m_is_clicked and m_attacking):
				
				var toAttack = get_global_mouse_position()
				Grid.request_attack(self, m_actual_attack, toAttack)
		
		
func attack():
	m_attacking = true
	Grid.prepare_attack(self, self.m_actual_attack)
	#guardamos el ataque según el botón que elijamos. Solo tenemos uno
		
	
	
func clicked():
	m_is_clicked = true
	Grid.prepare_movement(self)
	if(!is_boss):
		Grid.print_cell(m_actual_cell, 2)
	else:
		Grid.print_cell(m_actual_cell, 16)
	

func get_damage(hab):
	self.m_health -= hab.hability_damage
	if(self.m_health < 0):
		self.kill()


func kill():
	$Sprite.modulate = Color( 1, 1, 1, 0.5 )
	yield(get_tree().create_timer(0.35), "timeout")
	if is_instance_valid(self):
		$Sprite.modulate = Color( 1, 1, 1, 0)
	yield(get_tree().create_timer(0.4), "timeout")
	if is_instance_valid(self):
		emit_signal("on_death", self)
		self.queue_free()

func flip_sprite(orien):
	$Sprite.set_flip_h(!orien)


func set_to_cell(x, y):
	self.position = Grid.mapToWorld(Vector2(x , y))
	m_actual_cell = Grid.worldToMap(self.position)
	Grid.print_cell(m_actual_cell, m_cell_player)
	
