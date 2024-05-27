extends Node2D

@onready var sprite: AnimatedSprite2D = $Sprite

var last_pos: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D/AnimationPlayer.seek(randf_range(0, $AnimatedSprite2D/AnimationPlayer.current_animation_length))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_direction()

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is Player:
		body.taking_damage = true
		
func change_direction() -> void:
	if last_pos.x - sprite.position.x > 0:
		sprite.flip_h = true
	elif last_pos.x - sprite.position.x < 0:
		sprite.flip_h = false
	last_pos = sprite.position
