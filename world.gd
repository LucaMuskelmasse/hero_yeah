extends Node2D


func _ready():
	var player = get_tree().get_root().get_node("world/sounds/backgroundmusic")
	player.play()
	
