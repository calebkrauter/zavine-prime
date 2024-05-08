@tool

extends HBoxContainer

var health_item = preload("res://health_item.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	create_health(3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_health(max: int) -> void:
	for i in max:
		var instanceOfHealthItem = health_item.instantiate()
		add_child(instanceOfHealthItem)
