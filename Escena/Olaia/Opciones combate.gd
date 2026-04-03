extends CanvasLayer

var pawn_clicked

func _on_Attack_pressed():
	if(pawn_clicked != null):
		pawn_clicked.attack()
