extends Node2D
export (PackedScene) var Termometro
export (PackedScene) var respuestaIncorrecta
onready var nube = $nube/Sprite
var nube0= preload("res://Sprites/evaporacion/nubepequeña.png")
var nube1= preload("res://Sprites/evaporacion/nube mediana.png")
var nube2= preload("res://Sprites/evaporacion/nube_alta.png")
var instanciaDeTermometro = []
var selected = false
var selectedVientoHorizontal = false
var selectedVientoVertical = false
var tipoNube = ""
var baseTemp = 10
func _ready():
	pass # Replace with function body.



func _process(delta):
	var flag = false
	for element in instanciaDeTermometro:
		element.changeTemp(calcularTemperatura(element))
		if element.selected:
			flag = true
	if flag == true:
		selected = true
	if not flag and not selectedVientoHorizontal and not selectedVientoVertical:
		selected = false
	if selectedVientoVertical:
		$menuLateral/areaVientoVertial.position = get_global_mouse_position()
		print($menuLateral/areaVientoVertial.position)
	if selectedVientoHorizontal:
		$menuLateral/areaVientoHorizontal.position = get_global_mouse_position()
		print($menuLateral/areaVientoHorizontal.position)
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


func _on_termometroBtn_pressed():
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


func _on_menuprincipal_pressed():
	get_tree().change_scene("res://mainMenu.tscn")

func calcularTemperatura(T):
	if T.position.y < 105:
		return baseTemp - 30
	else:
		if T.position.y > 105 and T.position.y < 220:
			return baseTemp - 10
		else:
			 return baseTemp + 5

func followMouse():
	position = get_global_mouse_position()

func _on_areaVientoHorizontal_input_event(viewport, event, shape_idx):
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		print("clic")
		if event.pressed and not selected and not selectedVientoHorizontal:
			selected = true
			selectedVientoHorizontal = true
		else:
			if event.pressed and selected and selectedVientoHorizontal:
					selectedVientoHorizontal = false
					selected = false


func _on_areaVientoVertial_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:

		if event.pressed and not selected and not selectedVientoVertical:
			print("clic")
			selected = true
			selectedVientoVertical = true
		else:
			if event.pressed and selected and selectedVientoVertical:
				selectedVientoVertical = false
				selected = false



func _on_HSlider_value_changed(value):
	baseTemp = value
	$Label.text = str(baseTemp)

func _on_comprobar_pressed():
	var posvientovertial = $menuLateral/areaVientoVertial.position.x
	var posvientohorizonal = $menuLateral/areaVientoHorizontal.position.x
	var isBaseTempCorrect = baseTemp < 20 and baseTemp > 10
	var isposVientoVerticalCorrect = posvientovertial > 330 and posvientovertial < 510
	var isposVientoHorizontalCorrect = posvientohorizonal > 880
	var isNubeCorrect = tipoNube == "alta"
	if isBaseTempCorrect and  isposVientoVerticalCorrect and isposVientoHorizontalCorrect and isNubeCorrect:
		get_tree().change_scene("res://desafios_escenas/desafio1_correcto.tscn")
	else:
		var sceneIncorrecta = respuestaIncorrecta.instance()
		sceneIncorrecta.isBaseTempCorrect =isBaseTempCorrect 
		sceneIncorrecta.isposVientoVerticalCorrect =isposVientoVerticalCorrect
		sceneIncorrecta.isposVientoHorizontalCorrect =isposVientoHorizontalCorrect
		sceneIncorrecta.isNubeCorrect = isNubeCorrect
		add_child(sceneIncorrecta)

		
