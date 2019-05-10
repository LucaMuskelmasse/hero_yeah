extends KinematicBody2D

var velocity = Vector2(100, 0)
const SPEED = 100

func _physics_process(delta):
	
	
	move_and_slide(velocity)

func _on_enemytot1_body_entered(body):
	var player = get_tree().get_root().get_node("world/sounds/enemytot")
	player.play()
	get_parent().remove_child(self)


func _on_Monsterumkehrding_area_entered(area):
	if area.get_parent() == self:
		velocity.x = -velocity.x
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
