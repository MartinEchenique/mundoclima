extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocidad = 0
var Movimiento = Vector2()
var limite 
var selected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	limite = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Movimiento = Vector2()
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 100 
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 100 
	position += Movimiento * delta
	position.x = clamp(position.x, 0, limite.x)

