extends Node2D
@onready var sprite: AnimatedSprite2D = $Sprite

var last_pos: Vector2
func _ready() -> void:
	#Not sure why this line breaks the game. But seems to work without it.
	$Sprite/AnimationPlayer.seek(randf_range(0, $Sprite/AnimationPlayer.current_animation_length))


func _process(delta: float) -> void:
	change_direction()

#Should be using on_hit_box instead of area_2d, can't find it to connect the signal.
#func _on_hit_box_body_entered(body: Node2D) -> void:
	#if body is Player:
		#body.taking_damage = true
		
func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is Player:
		body.taking_damage = true

func change_direction() -> void:
	if last_pos.x - sprite.position.x > 0:
		sprite.flip_h = true
	elif last_pos.x - sprite.position.x < 0:
		sprite.flip_h = false
	last_pos = sprite.position


