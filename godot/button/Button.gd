extends StaticBody2D
class_name CoolButton

@export var color: Color = Color.WHITE;

var p := false;
signal pressed
@export var _reset: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Button.modulate = color;

func press():
	if(!p):
		emit_signal('pressed')
		$Button.position.y += 7
		p = true;
		if _reset:
			await get_tree().create_timer(0.5).timeout
			reset()

func reset():
	p = false
	$Button.position.y -= 7

func _on_interactable_component_interacted():
	press()
