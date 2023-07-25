extends Node2D

var entered := false;
signal interacted;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	if(Input.is_action_just_pressed("interact") and entered):
		emit_signal("interacted")
		print('bruh')

func _on_interact_area_body_entered(body):
	if body.name == "PlayerController":
		entered = true;

func _on_interact_area_body_exited(body):
	if body.name == "PlayerController":
		entered = false;
