extends CharacterBody2D


const SPEED = 180.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta) -> void:

	var direction := Input.get_vector("ui_left", "ui_right",  "ui_up", "ui_down")
	if direction.x == 1:
		$AnimatedSprite2D.play("left")
	elif direction.x == -1:
		$AnimatedSprite2D.play("right")
	else:
		$AnimatedSprite2D.play("default")
	
	velocity = direction * SPEED
	
	move_and_slide()
