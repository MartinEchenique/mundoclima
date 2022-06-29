extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_desafio1_granizo_pressed():
	get_tree().change_scene("res://desafios_escenas/desafio_1.tscn")


func _on_menuprincipal_pressed():
	get_tree().change_scene("res://mainMenu.tscn")
