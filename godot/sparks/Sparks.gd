extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if button != null:
		button.connect("pressed", _button_pressed)

var entered := false;

@export var button: Node2D = null;

func _button_pressed():
	visible = !visible
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Timer.is_stopped(): $Timer.start()
	if visible:
		if !$AudioStreamPlayer2D.playing: $AudioStreamPlayer2D.play()
	else:
		$AudioStreamPlayer2D.stop()


func _on_timer_timeout():
	var sprites = []
	randomize()
	for child in get_children():
		if child is Sprite2D:
			sprites.append(child)
			if child.visible == false: child.visible = true
			sprites.pick_random().visible = false


func _on_area_2d_body_entered(body):
	if body.name == "PlayerController":
		entered = true;
		if visible:
			PlayerManager.deplete_hp()
			PlayerManager.unique_stream("res://assets/sound/hitHurt.wav", 1)
			$DamageTimer.start(0.5)


func _on_area_2d_body_exited(body):
	if body.name == "PlayerController":
		entered = false;
		$DamageTimer.stop()


func _on_damage_timer_timeout():
	if visible:
		PlayerManager.deplete_hp()
		PlayerManager.unique_stream("res://assets/sound/hitHurt.wav", 1)
