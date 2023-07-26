extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Bg.position.x -= 50 * delta


func _on_button_pressed():
	PlayerManager.unique_stream("res://assets/sound/slow-travel.wav", 1)
	MainScene.change_scene(load("res://levels/level_0.tscn"))
	PauseManager.can_pause = true;
