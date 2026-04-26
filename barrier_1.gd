extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_dialogue_layer_answered_correctly1() -> void:
	var dialogue = preload("res://dialogue_layer.tscn").instantiate()
	get_tree().current_scene.add_child(dialogue)
	dialogue.start_dialogue(["The barrier has been unlocked."], "Mysterious voice", preload("res://icon.svg"))
	await dialogue.tree_exited
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("correctanswer1"):
		_on_dialogue_layer_answered_correctly1()
