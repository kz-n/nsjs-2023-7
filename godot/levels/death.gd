extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Bg.position.x -= 50 * delta


func _on_load_button_pressed():
	CheckpointManager._load()


func _on_quit_button_pressed():
	MainScene.change_scene(load("res://menu/Menu.tscn"))
