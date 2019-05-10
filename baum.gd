extends KinematicBody2D

var velocity = Vector2(0, 100)
const SPEED = 100

func _ready():
	$AnimatedSprite.flip_h = true


func _physics_process(delta):
	
	
	move_and_slide(velocity)

func _on_enemytot1_body_entered(body):
	var player = get_tree().get_root().get_node("world/sounds/enemytot")
	player.play()
	get_parent().remove_child(self)


func _on_Monsterumkehrding_area_entered(area):
	if area.get_parent() == self:
		velocity.y = -velocity.y
