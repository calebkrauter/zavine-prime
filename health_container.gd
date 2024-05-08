@tool

extends HBoxContainer

var health_item = preload("res://health_item.tscn")

var health_group: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_health(max: int) -> void:
	for i in max:
		var instance = health_item.instantiate()
		add_child(instance)
		health_group.append(instance)
		instance.id = i + 1
		
func update_health(current_health: int) -> void:
	for item in health_group:
		if item.id <= current_health:
			item.active = true
		else:
			item.active = false
		item.update_state()
