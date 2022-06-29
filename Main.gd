extends Node
var Movimiento = Vector2()
var limite 

# Called when the node enters the scene tree for the first time.
func _ready():
	limite = $Nube/spite_nube.get_viewport_rect().size



func _process(delta):
	var temperatura = $Sliders/HSliderTemp.value
	if temperatura <=0:
		$Nube/spite_nube.set_animation("Negra") 
	else: 
		$Nube/spite_nube.set_animation("Blanca") 

	Movimiento.x = $Sliders/HSlider2Viento.value

	$Nube/spite_nube.position += Movimiento * delta
	$Nube/spite_nube.position.x = clamp($Nube/spite_nube.position.x, 0, limite.x)


func _on_Nube_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("A click!")
