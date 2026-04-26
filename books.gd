extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (is_in_group("book1")):
		$".".visible = false
		$"../redBook".visible = true
		print ("book1")
	elif (is_in_group("book2")):
		$"../book2".visible = false
		$"../greenBook".visible = true
		print ("book2")
	elif (is_in_group("book3")):
		$"../book3".visible = false
		$"../blueBook".visible = true
		print ("book3")


func _on_bed_area_body_entered(body: Node2D) -> void:
	if $"../blueBook".visible == true and $"../greenBook".visible == true and $"../redBook".visible == true:
		$"../AnimationPlayer".play("transition")
		$"../ColorRect2/RichTextLabel".text = "Head to bed now!"
		await $"../AnimationPlayer".animation_finished
		get_tree().change_scene_to_file("res://world.tscn")
		print ("bed!")
