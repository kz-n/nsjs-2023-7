extends Node

var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print('asd')

func set_player(p): player = p

func get_player() -> CharacterBody2D: return player;

var o2: float = 30;
var hp: float = 50;

func refill_o2():
	o2 += 5;
	if o2 > 30: o2 = 30;
func deplete_o2(): o2 -= 1

func deplete_hp(): hp -= 3.0
func refill_health():
	hp += 10
	if hp > 50: hp = 50;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func random_sfx(path):
	
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	var file_name = dir.get_next()
	var files = []
	while file_name != "":
		if !dir.current_is_dir():
			if !file_name.ends_with(".import"):
				files.append(file_name)
		file_name = dir.get_next()
	randomize()
	var rand_idx = int(randi_range(0,files.size()))
	
	unique_stream(load(path+files[rand_idx]), randi_range(0.7,1.3))

func unique_stream(path, pitch):
	var audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.stream = load(path)
	audio_player.pitch_scale = pitch
	audio_player.play()
	await audio_player.finished
	audio_player.queue_free()
