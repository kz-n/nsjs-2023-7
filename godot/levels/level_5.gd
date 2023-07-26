extends Node2D

var states = [false, false, false, false]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var idx = 0
	if states == [true, true, true, true]:
		$Puzzle/Button1.queue_free()
		$Puzzle/Button2.queue_free()
		$Puzzle/Button3.queue_free()
		$Puzzle/Button4.queue_free()
		
		$Puzzle/Sparks1.visible = false
		$Puzzle/Sparks2.visible = false
		$Puzzle/Sparks3.visible = false
		$Puzzle/Sparks4.visible = false
		
		states = null
	if states != null:
		for state in states:
			var button = get_node("Puzzle/Button"+str(idx+1))
			if state:
				button.color = Color.hex(0x009cfbff)
			else:
				button.color = Color.WHITE
			idx += 1

func _on_button_1_pressed():
	states[1] = true


func _on_button_2_pressed():
	states[0] = true


func _on_button_3_pressed():
	if states[0]: states[3] = true


func _on_button_4_pressed():
	if !states[0] and !states[1]:
		states[2] = true
	else:
		states[0] = false; states[1] = false


func _on_submit_pressed():
	states = [false, false, false, false]
