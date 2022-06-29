extends Area2D


onready var button = $formaNube/OptionButton

var img1 = preload("res://Sprites/evaporacion/nube mediana.png")
var img2 = preload("res://Sprites/evaporacion/nubepequeña.png")
var img3 = preload("res://Sprites/evaporacion/nube_alta.png")
func _ready():
	addTextures()

func addTextures():
	button.add_item("")
	button.set_item_icon(0,img2)
	button.add_item("")
	button.set_item_icon(1,img1)
	button.add_item("")
	button.set_item_icon(2,img3)

