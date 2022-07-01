extends Node2D

var isBaseTempCorrect = false
var isposVientoVerticalCorrect = false
var isposVientoHorizontalCorrect = false
var isNubeCorrect = false
var placedCounter = 0
func _ready():
	if not isBaseTempCorrect:
		$temperaturaContainer.visible = true
		placedCounter = placedCounter + 1
	if not isposVientoVerticalCorrect:
		$vientoVeritcalContainer.position.y = 120 * placedCounter
		placedCounter = placedCounter + 1
		$vientoVeritcalContainer.visible = true
	if not isNubeCorrect:
		$nubeContainer.position.y = 120 * placedCounter
		placedCounter = placedCounter + 1
		$nubeContainer.visible = true
	if not isposVientoHorizontalCorrect:
		$vientoHorizontalContainer.position.y = 120 * placedCounter
		placedCounter = placedCounter + 1
		$vientoHorizontalContainer.visible = true
func _on_menuprincipal_pressed():
	get_tree().change_scene("res://mainMenu.tscn")


func _on_Button_pressed():
		get_tree().change_scene("res://desafios_escenas/desafio_1.tscn")


func _on_aGuia_pressed():
	get_tree().change_scene("res://guia_escenas/menuGuia.tscn")


func _on_Button2_pressed():
		get_tree().change_scene("res://guia_escenas/MenuDesafios.tscn")
