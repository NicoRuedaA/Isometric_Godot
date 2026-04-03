extends CanvasLayer


# Declare member variables here. Examples:
onready var button_attack = $Node2D/Attack
onready var me = $Node2D
var show

# Called when the node enters the scene tree for the first time.
func _ready():
	show = false
	
func _process(delta):
	show = get_parent().thinking
	if(show):
		me.show()
		button_attack.set_disabled(!show)
	else:
		me.hide()
		button_attack.set_disabled(show)
		
	
func show_me():
	show = true


func hide_me():
	show = false

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
