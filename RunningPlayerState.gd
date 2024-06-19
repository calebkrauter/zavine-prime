class_name RunningPlayerState

extends State


func enter() -> void:
	player.sprite.play("Run")

func exit() -> void:
	pass

func update(delta: float) -> void:
	var input_vector = player.get_input_vector()
	
	player.apply_movement(input_vector, delta)
	player.change_direction(input_vector.x)
	
	player.apply_gravity(delta)
	player.apply_velocity(delta)
	
	if input_vector.x == 0:
		transition.emit("IdlePlayerState")
	
	if Input.is_action_just_pressed("jump") and owner.is_on_floor():
		transition.emit("JumpPlayerState")
	
	if player.velocity.y > 1.0:
		transition.emit("FallPlayerState")	
	if player.taking_damage == true:
		transition.emit("DamagePlayerState")
	
	if Input.is_action_just_pressed("shoot"):
		transition.emit("ShootingPlayerState")

func physics_process(delta: float) -> void:
	pass
