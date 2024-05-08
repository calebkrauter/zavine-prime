class_name UserInterface extends CanvasLayer

@onready var health_container = $HealthContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.UI = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
