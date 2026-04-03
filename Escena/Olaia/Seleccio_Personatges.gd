extends CanvasLayer

var personatges_int : int = 0
var personatges2_int : int = 1

var sprites_sets


func _ready() -> void:
	sprites_sets = [$"0", $"1", $"2", $"3"]
	$TextureRect.set_texture(sprites_sets[personatges_int].texture)
	$TextureRect2.set_texture(sprites_sets[personatges2_int].texture)


func _on_left_pressed():
	if personatges_int <= 0 :
		personatges_int = sprites_sets.size()-1
		
	else :
		personatges_int -= 1
	$TextureRect.set_texture(sprites_sets[personatges_int].texture);


func _on_rigth_pressed():
	if personatges_int >= sprites_sets.size()-1:
		personatges_int = 0
	else :
		personatges_int += 1
	$TextureRect.set_texture(sprites_sets[personatges_int].texture)


func _on_player2_left_pressed():
	if personatges2_int <= 0 :
		personatges2_int = sprites_sets.size()-1
		
	else :
		personatges2_int -= 1
	$TextureRect2.set_texture(sprites_sets[personatges2_int].texture);


func _on_player2_rigth_pressed():
	if personatges2_int >= sprites_sets.size()-1:
		personatges2_int = 0
	else :
		personatges2_int += 1
	$TextureRect2.set_texture(sprites_sets[personatges2_int].texture)


func _on_barra_pressed():
	GlobalSettings.set_player_1 = personatges_int
	GlobalSettings.set_player_2 = personatges2_int
	get_tree().change_scene("res://Escena/gameplay.tscn")
