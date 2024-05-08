extends Panel

@onready var sprite: Sprite2D = $Sprite2D

var battery_on: = preload("res://assets/Super Grotto Escape Files/Props/Sprites/Battery/battery1.png")
var battery_off: = preload("res://assets/Super Grotto Escape Files/Props/Sprites/Battery/battery2.png")

var active: bool = true
var id: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_state() -> void:
	if active == true:
		sprite.texture = battery_on
	elif active == false:
		sprite.texture = battery_off
