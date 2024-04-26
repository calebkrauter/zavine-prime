class_name Player

extends CharacterBody2D

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if not is_on_floor():
		apply_gravity(delta)
	
	move_and_slide()

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
