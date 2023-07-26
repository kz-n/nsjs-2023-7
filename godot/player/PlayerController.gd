extends CharacterBody2D

var speed = 200  # speed in pixels/sec

var moving := false
var anim_moving = false


func _ready():
	PlayerManager.set_player(self)
	if $O2Timer.is_stopped(): $O2Timer.start(1)
	CheckpointManager._save()
	
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	moving = velocity != Vector2.ZERO
	
	if velocity.x < 0:
		$CollisionShape2D/AnimatedSprite2D.flip_h = true;
	else:
		$CollisionShape2D/AnimatedSprite2D.flip_h = false;
	
	if moving and not anim_moving:
		$CollisionShape2D/AnimatedSprite2D.play("walk")
		anim_moving = true
	elif not moving and anim_moving:
		$CollisionShape2D/AnimatedSprite2D.play("idle")
		anim_moving = false
	
	move_and_slide()

func _process(_delta):
	$CanvasLayer/ColorRect.material.set_shader_parameter("player_position", get_global_transform_with_canvas().origin / Vector2(get_window().size))
	$CanvasLayer/O2ProgressBar.value = PlayerManager.o2;
	$CanvasLayer/HpProgressBar.value = PlayerManager.hp


func _on_o_2_timer_timeout():
	if PlayerManager.o2 > 0:
		PlayerManager.deplete_o2()
	if is_zero_approx(PlayerManager.o2) or PlayerManager.o2 < 0:
		PlayerManager.deplete_hp()
	if is_zero_approx(PlayerManager.hp) or PlayerManager.hp < 0:
		MainScene.change_scene(load("res://levels/death.tscn"))
