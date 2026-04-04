extends CanvasLayer


# Declare member variables here. Examples:
onready var button_attack = $Node2D/Attack
onready var button_hab1 = $"Node2D/Habilidad-1"
onready var button_hab2 = $"Node2D/Habilidad-2"
onready var me = $Node2D
onready var health_bar = $Node2D/ProgressBar
onready var player_label = $Node2D/Label
var show

# Called when the node enters the scene tree for the first time.
func _ready():
	show = false
	var parent = get_parent()
	if parent.has_signal("thinking_changed"):
		parent.connect("thinking_changed", self, "_on_thinking_changed")
	if parent.has_signal("pawn_selected"):
		parent.connect("pawn_selected", self, "_on_pawn_selected")
	_update_ui(show)
	
func _on_pawn_selected(pawn):
	if health_bar:
		health_bar.min_value = 0
		health_bar.max_value = pawn.m_max_health
		health_bar.value = pawn.m_health
	if player_label:
		player_label.text = pawn.name + " (HP: " + str(pawn.m_health) + "/" + str(pawn.m_max_health) + ")"
		
	var habilities = pawn.m_habilities
	
	if habilities.size() > 0:
		button_attack.text = habilities[0].hability_name
		button_attack.show()
	else:
		button_attack.hide()
		
	if habilities.size() > 1:
		button_hab1.text = habilities[1].hability_name
		button_hab1.show()
	else:
		button_hab1.hide()
		
	if habilities.size() > 2:
		button_hab2.text = habilities[2].hability_name
		button_hab2.show()
	else:
		button_hab2.hide()
	
func _on_thinking_changed(is_thinking):
	show = is_thinking
	_update_ui(show)

func _update_ui(is_thinking):
	if(is_thinking):
		me.show()
	else:
		me.hide()
		
	
func show_me():
	show = true


func hide_me():
	show = false

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
