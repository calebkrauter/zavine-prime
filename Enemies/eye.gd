extends Node2D

@onready var sprite: AnimatedSprite2D = $Sprite

var alert: bool = false
var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite/AnimationPlayer.seek(randf_range(0, $Sprite/AnimationPlayer.current_animation_length))
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if alert == true:
		change_direction()


func change_direction() -> void:
	if position.x - player.position.x > 0:
		sprite.flip_h = false
	elif position.x - player.position.x < 0:
		sprite.flip_h = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.taking_damage = true

func _on_vision_body_exited(body: Node2D) -> void:
	if body is Player:
		alert = false
		player = null



func _on_vision_body_entered(body: Node2D) -> void:
	if body is Player:
		alert = true
		player = body
