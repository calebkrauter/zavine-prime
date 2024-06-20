extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	play_music()


func play_laser() -> void:
	$Laser.play()

func play_gameover() -> void:
	$GameOver.play()

func play_explosion() -> void:
	$Explosion.play()

func play_pickup() -> void:
	$Pickup.play()

func play_jump() -> void:
	$Jump.play()
	
func play_take_damage() -> void:
	$TakeDamage.play()

func play_music() -> void:
	$Music.play()
