extends Node2D
@onready var sprite: AnimatedSprite2D = $Sprite

var speed = 250
var moving: bool = true
var direction
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play("Fired")
	await get_tree().create_timer(3).timeout
	explode()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving == true:
		match direction:
			"left":
				position.x += -speed * delta
				sprite.flip_h = true
			"right":
				position.x += speed * delta
		

func explode() -> void:
	sprite.play("Hit")
	moving = false
	AudioManager.play_explosion()
	await sprite.animation_finished
	queue_free()



func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		area.owner.queue_free()
		explode()
