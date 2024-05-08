class_name Player

extends CharacterBody2D

@export var speed: float = 100.0
@export var acceleration: float = 0.25
@export var gravity: float = 500.0
@export var jump_velocity: float = 200.0
@export var max_health: int = 10

@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	Global.UI.health_container.create_health(max_health)
	
func _process(delta: float) -> void:
	pass
	
func get_input_vector() -> Vector2:
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_axis("left", "right")
	return input_vector

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
func apply_movement(input_vector: Vector2, delta: float) -> void:
# Lerp interpolates two values which could be "to" and "from" using the factor/weight which is acceleration.
# Any time the input_vector.x * speed is applied to the current velocity.x they are interpolated using the acceleration.
# This means that in this case the acceleration is applied lineraly to the delta in velocities to account for smooth acceleration.
	velocity.x = lerp(velocity.x, input_vector.x * speed, acceleration)

func apply_velocity(delta: float) -> void:
	move_and_slide()

func apply_jump() -> void:
	velocity.y -= jump_velocity

func change_direction(direction) -> void:
	if sign(direction) == -1:
		sprite.flip_h = true
	elif sign(direction) == 1:
		sprite.flip_h = false
