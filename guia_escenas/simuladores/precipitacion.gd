extends Node2D
export (PackedScene) var Termometro
onready var nube = $nube/Sprite
var nube0= preload("res://Sprites/evaporacion/nubepequeña.png")
var nube1= preload("res://Sprites/evaporacion/nube mediana.png")
var nube2= preload("res://Sprites/evaporacion/nube_alta.png")
var instanciaDeTermometro = []
var selected = false
var selectedVientoHorizontal = false
var selectedVientoVertical = false
var selectedVientoHorizontal2 = false
var tipoNube = ""
var baseTemp = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	update_output()
	var flag = false
	for element in instanciaDeTermometro:
		element.changeTemp(calcularTemperatura(element))
		if element.selected:
			if flag == true:
				element.selected = false
			flag = true
			
	if flag == true:
		selected = true
	if not flag and not selectedVientoHorizontal and not selectedVientoVertical and not selectedVientoHorizontal2:
		selected = false
	if selectedVientoVertical:
		$menuLateral/areaVientoVertial.position = get_global_mouse_position()
		print($menuLateral/areaVientoVertial.position)
	if selectedVientoHorizontal:
		$menuLateral/areaVientoHorizontal.position = get_global_mouse_position()
		print($menuLateral/areaVientoHorizontal.position)
	if selectedVientoHorizontal2:
		$menuLateral/areaVientoHorizontal2.position = get_global_mouse_position()
		print($menuLateral/areaVientoHorizontal2.position)


func _on_menuprincipal_pressed():
	get_tree().change_scene("res://guia_escenas/simuladores/evaporacionCondensacion.tscn")

func followMouse():
	position = get_global_mouse_position()

func _on_termometroBtn_button_down():
		if instanciaDeTermometro.size() < 3 and not selected:
			var drag = false
			for element in instanciaDeTermometro:
				if element.selected == true:
					drag = true
			if not drag:
				var T = Termometro.instance()
				T.changeTemp(calcularTemperatura(T))
				add_child(T)
				instanciaDeTermometro.append(T)
				T.selected=true
				selected=true
		if instanciaDeTermometro.size() == 3:
			$menuLateral/termometro.visible = false
			$menuLateral/termometroBtn.visible = false

func calcularTemperatura(T):
	if T.position.y <= 170:
		return baseTemp - 30
	else:
		if T.position.y > 170 and T.position.y < 260:
			return baseTemp - 10
		else:
			 return baseTemp + 5
func _input( event ):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:

		for element in instanciaDeTermometro:
			if element.selected:
				element.selected = false
func _on_OptionButton_item_selected(index):
	 if index == 0:
			nube.set_texture(nube0)
			tipoNube = "pequeña"
	 if index == 1:
			nube.set_texture(nube1)
			tipoNube = "mediana"
	 if index == 2:
			nube.set_texture(nube2)
			tipoNube = "alta"



func _on_HSlider_value_changed(value):
	baseTemp = value
	$Label.text = str(value)

func _on_areaVientoVertial_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:

		if event.pressed and not selected and not selectedVientoVertical:

			selected = true
			selectedVientoVertical = true
		else:
			if selected and selectedVientoVertical:
				selectedVientoVertical = false
				selected = false




func _on_areaVientoHorizontal_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:

		if event.pressed and not selected and not selectedVientoHorizontal:
			selected = true
			selectedVientoHorizontal = true
		else:
			if selected and selectedVientoHorizontal:
					selectedVientoHorizontal = false
					selected = false


func _on_areaVientoHorizontal2_input_event(viewport, event, shape_idx):
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
			if event.pressed and not selected and not selectedVientoHorizontal2:
				selected = true
				selectedVientoHorizontal2 = true
			else:
				if selected and selectedVientoHorizontal2:
						selectedVientoHorizontal2 = false
						selected = false

func update_output():
	var posvientovertial = $menuLateral/areaVientoVertial.position.x
	var posvientohorizonal = $menuLateral/areaVientoHorizontal.position.x
	var posvientohorizonal2 = $menuLateral/areaVientoHorizontal2.position.x
	var isBaseTempCorrect = baseTemp < 20 and baseTemp > 10
	var isposVientoVerticalCorrect = posvientovertial > 218 and posvientovertial < 321
	var isposVientoHorizontalCorrect = posvientohorizonal > 330 and posvientohorizonal < 800 
	var isposVientoHorizontal2Correct = posvientohorizonal2 < 330
	var isNubeCorrect = tipoNube == "alta"
	$precipitacionNombre.text = ""
	$granizo.visible = false
	$nieve.visible = false
	$lluvia.visible = false
	if isBaseTempCorrect and isNubeCorrect and isposVientoVerticalCorrect:
			$precipitacionNombre.text = "Granizo"
			$granizo.visible = true
			$nieve.visible = false
			$lluvia.visible = false
	else:
		if baseTemp < 0:
			$precipitacionNombre.text = "Nieve"
			$granizo.visible = false
			$nieve.visible = true
			$lluvia.visible = false
		else:
			if baseTemp < 20:
				$precipitacionNombre.text = "Lluvia convectiva"
				$granizo.visible = false
				$nieve.visible = false
				$lluvia.visible = true
			
			else:
				if isposVientoHorizontalCorrect and not isposVientoHorizontal2Correct:
					$precipitacionNombre.text = "Lluvia frontal"
					$granizo.visible = false
					$nieve.visible = false
					$lluvia.visible = true
					
				else:
					if not isposVientoHorizontalCorrect and isposVientoHorizontal2Correct:
						$precipitacionNombre.text = "Lluvia orografica"
						$granizo.visible = false
						$nieve.visible = false
						$lluvia.visible = true

