extends Node2D

@export var button: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$Puzzle1/Sparks.visible = false
	$Puzzle1/OxygenTank.visible = true
	$Puzzle1/OxygenTank2.visible = true
	$Puzzle1/Sparks2.visible = false


func _on_button_2_pressed():
	$Puzzle2/Timer.start(1)

var idx = 1
func _on_timer_timeout():
	print(idx)
	if idx > 6: idx = 1
	get_node("Puzzle2/Sparks" + str(idx)).visible = false
	await get_tree().create_timer(.5).timeout
	get_node("Puzzle2/Sparks" + str(clampi(idx+1, 1, 6))).visible = false
	await get_tree().create_timer(.5).timeout
	get_node("Puzzle2/Sparks" + str(idx)).visible = true
	idx += 1
	if idx > 6: idx = 1
