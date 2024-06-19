class_name ShootingPlayerState

extends State

func enter() -> void:
	player.sprite.play("Shoot")
	player.shoot()
	player.velocity.x = 0
	await player.sprite.animation_finished
	transition.emit("IdlePlayerState")


func exit() -> void:
	pass

func update(delta: float) -> void:
	var input_vector = player.get_input_vector()
	
	player.change_direction(input_vector.x)
	
	player.apply_gravity(delta)
	player.apply_velocity(delta)

func physics_update(delta: float) -> void:
	pass
