extends StaticBody2D
class_name CoolButton

@export var color: Color = Color.WHITE;

var p := false;
signal pressed
# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.modulate = color;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func press():
	if(!p):
		emit_signal('pressed')
		$Button.position.y += 7
		p = true;


func _on_interactable_component_interacted():
	press()
