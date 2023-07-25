extends Node

class_name MainScene

static var instance = null
# Called when the node enters the scene tree for the first time.
func _ready():
	instance = self;
	change_scene(load("res://levels/level_0.tscn"))

static func change_scene(scene: PackedScene):
	print(scene)
	if instance.get_node("Game").get_child_count() > 0:
		for child in instance.get_node("Game").get_children(): child.queue_free()
	instance.get_node("Game").add_child(scene.instantiate())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
