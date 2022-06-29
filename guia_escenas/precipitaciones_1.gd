extends Node

const EvaporacionPopup = preload("res://guia_escenas/ciclopopups/evaporacion.tscn")
const CondensacionPopup = preload("res://guia_escenas/ciclopopups/condensacion.tscn")
const PrecipitacionPopup = preload("res://guia_escenas/ciclopopups/precipitacion.tscn")
const InfiltracionPopup = preload("res://guia_escenas/ciclopopups/infiltracion.tscn")
const EscorrentiaPopup = preload("res://guia_escenas/ciclopopups/escorrentia.tscn")
func _ready():
	pass 

func _on_volverButton_pressed():
	get_tree().change_scene("res://guia_escenas/menuGuia.tscn")


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("A click!")





func _on_evaporacion_button_pressed():
	var  evaporacionPopup = EvaporacionPopup.instance()
	add_child(evaporacionPopup)


func _on_condensacion_button2_pressed():
	var  condensacionPopup = CondensacionPopup.instance()
	add_child(condensacionPopup)


func _on_escorrentia_button3_pressed():
	var  escorrentiaPopup = EscorrentiaPopup.instance()
	add_child(escorrentiaPopup)


func _on_infiltracion_button4_pressed():
	var  infiltracionPopup =  InfiltracionPopup.instance()
	add_child(infiltracionPopup)


func _on_precipitacion_button5_pressed():
	var  precipitacionPopup = PrecipitacionPopup.instance()
	add_child(precipitacionPopup)


func _on_ContinuarButton_pressed():
		get_tree().change_scene("res://guia_escenas/simuladores/evaporacionCondensacion.tscn")
