extends Node2D

@onready var player = get_parent().get_node("player")
var player_in_range = false

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		interact()
		
func interact():
	var dialogue = preload("res://dialogue_layer.tscn").instantiate()
	get_tree().current_scene.add_child(dialogue)
	dialogue.start_dialogue(["I steal the day and bring the night, I close your eyes and dim the light, And set your dreaming spirit right.", "Melatonin, Sleep, or Nyx, Goddess of the night? Answer by typing the first letter of your answer."], "REM Rem", preload("res://npc.png"))
	await dialogue.tree_exited
	



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "player":
		player_in_range = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "player":
		player_in_range = false
		
