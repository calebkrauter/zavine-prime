class_name UserInterface extends CanvasLayer

@onready var health_container = $HealthContainer
@onready var game_over = $GameOver

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.UI = self
	game_over.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
