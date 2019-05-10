extends KinematicBody2D

func _ready():
	$AnimatedSprite.flip_h = true


func _on_enemytot1_body_entered(body):
	var player = get_tree().get_root().get_node("world/sounds/enemytot")
	player.play()
	get_parent().remove_child(self)


