extends Node

var paused := false
var scene = load("res://autoload/PauseManager.tscn").instantiate()
var can_pause := false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_mode(PROCESS_MODE_ALWAYS)
	add_child(scene)
	scene.get_node("CanvasLayer/Control/VBoxContainer/LoadButton").connect("pressed", _load_pressed)
	scene.get_node("CanvasLayer/Control/VBoxContainer/QuitButton").connect("pressed", _quit_pressed)

func _load_pressed():
	CheckpointManager._load()
	paused = false;

func _quit_pressed(): MainScene.change_scene(load("res://menu/Menu.tscn")); paused = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_child(0).get_child(0).visible = paused
	get_tree().paused = paused
	if can_pause:
		if Input.is_action_just_pressed("pause"):
			paused = !paused
