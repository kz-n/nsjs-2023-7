extends Node2D

@export var change_to: PackedScene;

# Called when the node enters the scene tree for the first time.
func _ready():
	print(str(change_to) + "ASDASd ")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interactable_component_interacted():
	MainScene.change_scene(change_to)
 
