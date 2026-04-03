extends CanvasLayer

func _ready():
	print(GlobalSettings.winner)
	print(GlobalSettings.loser)
	$Victory.text = (str(GlobalSettings.winner) + " Wins !!" + "\n" + "\n" +  str(GlobalSettings.loser) + " loses !!")
	self.show()



func _on_Play_Again_pressed():
	get_tree().change_scene("res://Escena/gameplay.tscn")


func show():
	$AnimationPlayer.play("show")
	
	
func _on_Settings_pressed():
	get_tree().change_scene("res://Escena/Olaia/HUD_PRINCIPAL.tscn")
