extends Area2D
var selected = true
var temp = ""


func _process(delta):
	if selected: 
		followMouse()

func followMouse():
	position = get_global_mouse_position()



func _on_Termometro_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		print(temp)
		if event.pressed:
			selected = not selected
	#	else:
	#		selected = false
func changeTemp(newTemp):
	temp =  newTemp
	$Label.text = str(temp)
