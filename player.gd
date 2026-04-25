extends Node2D

var interact_target = null

func _process(_delta):
	if interact_target and Input.is_action_just_pressed("interact"):
		interact_target.interact()

func _on_interaction_area_body_entered(body):
	if body.has_method("interact"):
		interact_target = body

func _on_interaction_area_body_exited(body):
	if body == interact_target:
		interact_target = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
