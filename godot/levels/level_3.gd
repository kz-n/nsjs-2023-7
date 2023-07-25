extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sparks.visible = _1_on
	$Sparks2.visible = _2_on
	$Sparks3.visible = _3_on


func _on_button_pressed():
	$SpawnTimer.start(1.5)
	$Timer.start(3)

var count := 2
func _on_spawn_timer_timeout():
	if count == 2:
		$Timer2.start(3)
	elif count == 3:
		$Timer3.start(3)
	else: $SpawnTimer.stop()
	count += 1
	

var _1_on := true
var _2_on := true
var _3_on := true
func _on_timer_timeout():
	_1_on = !_1_on


func _on_timer_2_timeout():
	_2_on = !_2_on


func _on_timer_3_timeout():
	_3_on = !_3_on
