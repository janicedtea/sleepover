extends Node2D

@onready var player = get_parent().get_node("player")
var player_in_range = false

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		interact()
		
func interact():
	var dialogue = preload("res://dialogue_layer.tscn").instantiate()
	get_tree().current_scene.add_child(dialogue)
	dialogue.start_dialogue(["I visit your mind while you slumber deep, Of faces and places, secrets I keep. From waking hours, I often leap.", "Memory, hallucinations, or rabbit?", "Type the first letter of your answer to unlock the invisible barrier"], "Carrot...?", preload("res://npc3.png"))
	await dialogue.tree_exited
	



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "player":
		player_in_range = true
		

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "player":
		player_in_range = false
