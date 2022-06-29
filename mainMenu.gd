extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	pass

func _on_DesafioButton_pressed():
	get_tree().change_scene("res://guia_escenas/MenuDesafios.tscn")


func _on_GuideButton_pressed():
		get_tree().change_scene("res://guia_escenas/menuGuia.tscn")
