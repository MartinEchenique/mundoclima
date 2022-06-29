extends Node2D
var posicion = Vector2(493, 300) 
func _ready():
		$CanvasLayer/evaporacion1.position = posicion
		$CanvasLayer/evaporacion2.position = posicion
		$CanvasLayer/evaporacion3.position = posicion
	

func _on_HSlider_value_changed(value):

	if value <0:
		$CanvasLayer/evaporacion1.visible = false
		$CanvasLayer/evaporacion2.visible = false
		$CanvasLayer/evaporacion3.visible = false
		$CanvasLayer/nubepeque.visible = false

	else:
		if value < 10: 
			var scale = Vector2((value/2 * 0.1 ), (value/2 *0.1 ))
			$CanvasLayer/evaporacion1.visible = true
			$CanvasLayer/evaporacion1.set_scale(scale)
			$CanvasLayer/evaporacion2.visible = false
			$CanvasLayer/evaporacion3.visible = false
			$CanvasLayer/nubepeque.visible = true
			$CanvasLayer/nubegrande.visible = false
			$CanvasLayer/nubegrande2.visible = false
		else:
			if value < 25: 
				var scale = Vector2((value/2.5 * 0.1 ), (value/2.5 *0.1 ))
				$CanvasLayer/evaporacion1.visible = false
				$CanvasLayer/evaporacion2.visible = true
				$CanvasLayer/evaporacion2.set_scale(scale)
				$CanvasLayer/evaporacion3.visible = false
				$CanvasLayer/nubepeque.visible = true
				$CanvasLayer/nubegrande.visible = true
				$CanvasLayer/nubegrande2.visible = false
			else:
				var scale = Vector2((value/5 * 0.1 ), (value/5 *0.1 ))
				$CanvasLayer/evaporacion1.visible = false
				$CanvasLayer/evaporacion2.visible = false
				$CanvasLayer/evaporacion3.visible = true
				$CanvasLayer/evaporacion3.set_scale(scale)
				$CanvasLayer/nubepeque.visible = true
				$CanvasLayer/nubegrande.visible = true
				$CanvasLayer/nubegrande2.visible = true


func _on_menuprincipal_pressed():
	get_tree().change_scene("res://guia_escenas/precipitaciones_1.tscn")


func _on_siguiente_pressed():
	get_tree().change_scene("res://guia_escenas/simuladores/precipitacion.tscn")
