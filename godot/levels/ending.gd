extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerManager.get_child_count() != 0:
		for child in PlayerManager.get_children():
			queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Bg.position.x -= 50 * delta


func _on_quit_button_pressed():
	MainScene.change_scene(load("res://menu/Menu.tscn"))
