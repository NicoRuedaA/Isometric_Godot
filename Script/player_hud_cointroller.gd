extends CanvasLayer


# Declare member variables here. Examples:
onready var button_attack = $Node2D/Attack
onready var me = $Node2D
var show

# Called when the node enters the scene tree for the first time.
func _ready():
	show = false
	var parent = get_parent()
	if parent.has_signal("thinking_changed"):
		parent.connect("thinking_changed", self, "_on_thinking_changed")
	_update_ui(show)
	
func _on_thinking_changed(is_thinking):
	show = is_thinking
	_update_ui(show)

func _update_ui(is_thinking):
	if(is_thinking):
		me.show()
		button_attack.set_disabled(false)
	else:
		me.hide()
		button_attack.set_disabled(true)
		
	
func show_me():
	show = true


func hide_me():
	show = false

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
