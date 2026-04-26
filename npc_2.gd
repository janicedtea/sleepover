extends Node2D

@onready var player = get_parent().get_node("Player")
var player_in_range = false

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		interaction()
		
func interact():
	var dialogue = preload("res://dialogue_layer.tscn").instantiate()
	get_tree().current_scene.add_child(dialogue)
	dialogue.start_dialogue(["mmm.... oh, what's that? hi there! name's barley", "oh, you met peppermint yet?", "great cat, she is!", "oh, you're looking for the next riddle?", "alright, if three cats kill three rats in 3 minutes, how many would be needed to kill thirty rats in 15 minutes?", "good luck!"], "Barley", preload("res://npc2.png"))
	await dialogue.tree_exited
	

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_in_range = true

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player_in_range = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Player":
		player_in_range = true
		

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "Player":
		player_in_range = false

func interaction():
	print("yayy")
