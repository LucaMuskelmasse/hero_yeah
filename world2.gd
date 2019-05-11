extends Node2D

func _ready():
	var player = get_tree().get_root().get_node("world2/AudioStreamPlayer")
	player.play()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("world.tscn")