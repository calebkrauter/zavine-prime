class_name JumpShootingPlayerState

extends State

func enter() -> void:
	player.sprite.play("JumpShoot")
	player.shoot()
# Called when the node enters the scene tree for the first time.

func exit() -> void:
	pass

func update(delta: float) -> void:
	var input_vector = player.get_input_vector()
	
	player.apply_movement(input_vector, delta)
	player.change_direction(input_vector.x)
	
	player.apply_gravity(delta)
	player.apply_velocity(delta)
	
	if player.is_on_floor():
		transition.emit("IdlePlayerState")
	if player.taking_damage == true:
		transition.emit("DamagePlayerState")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
