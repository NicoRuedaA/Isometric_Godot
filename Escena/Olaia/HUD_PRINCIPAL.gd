extends CanvasLayer

onready var mouse = $clicked


func _on_Settings_pressed():
	$SettingsMenu.visible = true


func _on_Start_pressed():
	get_tree().change_scene("res://Escena/Olaia/Seleccio_Personatges.tscn")
