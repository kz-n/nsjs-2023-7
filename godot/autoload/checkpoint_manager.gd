extends Node

var saved_scene: Node = null

@onready var current_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@onready var current_save;

var hp = 0
var o2 = 0
var game_node

func _process(_delta):
	if Input.is_action_just_pressed("save"):
		_save()
	if Input.is_action_just_pressed("load"):
		_load()

func _save() -> void:
	print("saving")
	## Hack: Without this.. the game will save again every time a save is loaded
	##       This causes the save indicator to play after loading and I don't want
	##       to confuse the player any more than the game "plot" already does.
	
	## Question: Why does it save on load? Bug?
	await get_tree().create_timer(.01).timeout
	
	o2 = PlayerManager.o2
	hp = PlayerManager.hp
	current_save = get_node("/root/Main/Game")

	game_node = get_node("/root/Main/Game").duplicate()
func _load() -> void:
	get_node("/root/Main/Game").set_name("GameFreeing")
	get_node("/root/Main/GameFreeing").queue_free()
	get_node("/root/Main").add_child(game_node.duplicate())
	PlayerManager.o2 = o2
	PlayerManager.hp = hp
	PlayerManager.unique_stream("res://assets/sound/slow-travel.wav", 1)
