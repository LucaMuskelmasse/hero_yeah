extends KinematicBody2D

const GRAVITY = 12
const SPEED = 20
const MAX_SPEED = 250
const JUMP = 400
const DOUBLE_JUMP = 300
var velocity = Vector2()
var double_jump_used = true
var still_jumping = true

func _physics_process(delta):
	
	if Input.is_key_pressed(KEY_D):
		velocity.x += SPEED
		if velocity.x > MAX_SPEED:
			velocity.x = MAX_SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	elif Input.is_key_pressed(KEY_A):
		velocity.x += -SPEED
		if velocity.x < -MAX_SPEED:
			velocity.x = -MAX_SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	elif velocity.x > 0:
		velocity.x -= SPEED
		$AnimatedSprite.play("idle")
	elif velocity.x < 0:
		velocity.x += SPEED
		$AnimatedSprite.play("idle")
	else:
		velocity.x = 0
	
	if Input.is_key_pressed(KEY_SPACE):
		if is_on_floor():
			velocity.y = -JUMP
			double_jump_used = false
			still_jumping = true
		elif not double_jump_used && not still_jumping:
			velocity.y = -DOUBLE_JUMP
			double_jump_used = true
	else:
		still_jumping = false
	
	if not is_on_floor():
		velocity.y += GRAVITY
		$AnimatedSprite.play("jump")
	if is_on_floor() && velocity.x == 0:
		$AnimatedSprite.play("idle")
	
	if is_on_ceiling():
		velocity.y = 0
	if is_on_wall() && Input.is_key_pressed(KEY_SPACE):
		velocity.y = -JUMP/2
	move_and_slide(velocity, Vector2(0, -1))

func _on_enemytot1_body_entered(body):
	if body == self:
		velocity.y = -JUMP/1.5
		


func _on_playertot1_body_entered(body):
	if body == self:
		var player = get_tree().get_root().get_node("world/sounds/playertot")
		player.play()
		get_tree().paused = true


func _on_lava_body_entered(body):
	if body == self:
		var player = get_tree().get_root().get_node("world/sounds/playertot")
		player.play()
		get_tree().paused = true


func _on_playertot_finished():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_Area2D_body_entered(body):
	if body == self:
		var player = get_tree().get_root().get_node("world/sounds/playertot")
		player.play()
		get_tree().paused = true
	
